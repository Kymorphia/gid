/// Module for [Overlay] class
module gid.gtk3.overlay;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gdk3.rectangle;
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
    GtkOverlay is a container which contains a single main child, on top
    of which it can place “overlay” widgets. The position of each overlay
    widget is determined by its #GtkWidget:halign and #GtkWidget:valign
    properties. E.g. a widget with both alignments set to [gid.gtk4.types.Align.Start]
    will be placed at the top left corner of the GtkOverlay container,
    whereas an overlay with halign set to [gid.gtk4.types.Align.Center] and valign set
    to [gid.gtk4.types.Align.End] will be placed a the bottom edge of the GtkOverlay,
    horizontally centered. The position can be adjusted by setting the margin
    properties of the child to non-zero values.
    
    More complicated placement of overlays is possible by connecting
    to the #GtkOverlay::get-child-position signal.
    
    An overlay’s minimum and natural sizes are those of its main child. The sizes
    of overlay children are not considered when measuring these preferred sizes.
    
    # GtkOverlay as GtkBuildable
    
    The GtkOverlay implementation of the GtkBuildable interface
    supports placing a child as an overlay by specifying “overlay” as
    the “type” attribute of a `<child>` element.
    
    # CSS nodes
    
    GtkOverlay has a single CSS node with the name “overlay”. Overlay children
    whose alignments cause them to be positioned at an edge get the style classes
    “.left”, “.right”, “.top”, and/or “.bottom” according to their position.
*/
class Overlay : gid.gtk3.bin.Bin
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
    return cast(void function())gtk_overlay_get_type != &gidSymbolNotFound ? gtk_overlay_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkOverlay";
  }

  /** Returns `this`, for use in `with` statements. */
  override Overlay self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.overlay.Overlay]
      Returns: New builder object
  */
  static OverlayGidBuilder builder() nothrow
  {
    return new OverlayGidBuilder;
  }

  /**
      Creates a new #GtkOverlay.
      Returns: a new #GtkOverlay object.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_overlay_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Signal emitted to determine the position and
         size of any overlay child widgets.
  
      Params:
        widget = 
        allocation = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetChildPosition` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncGetChildPosition(gid.gtk3.widget.Widget widget, gid.gtk3.types.Allocation allocation)
  {
    auto _klass = cast(GtkOverlayClass*)_vfuncClass;
    if (!_klass.getChildPosition)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.getChildPosition(cast(GtkOverlay*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, cast(GtkAllocation*)&allocation);
    return _retval;
  }

  /**
      Adds widget to overlay.
      
      The widget will be stacked on top of the main widget
      added with [gid.gtk3.container.Container.add].
      
      The position at which widget is placed is determined
      from its #GtkWidget:halign and #GtkWidget:valign properties.
  
      Params:
        widget = a #GtkWidget to be added to the container
  */
  void addOverlay(gid.gtk3.widget.Widget widget) nothrow
  {
    gtk_overlay_add_overlay(cast(GtkOverlay*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Convenience function to get the value of the #GtkOverlay:pass-through
      child property for widget.
  
      Params:
        widget = an overlay child of #GtkOverlay
      Returns: whether the widget is a pass through child.
  */
  bool getOverlayPassThrough(gid.gtk3.widget.Widget widget) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_overlay_get_overlay_pass_through(cast(GtkOverlay*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Moves child to a new index in the list of overlay children.
      The list contains overlays in the order that these were
      added to overlay by default. See also #GtkOverlay:index.
      
      A widget’s index in the overlay children list determines which order
      the children are drawn if they overlap. The first child is drawn at
      the bottom. It also affects the default focus chain order.
  
      Params:
        child = the overlaid #GtkWidget to move
        index = the new index for child in the list of overlay children
            of overlay, starting from 0. If negative, indicates the end of
            the list
  */
  void reorderOverlay(gid.gtk3.widget.Widget child, int index) nothrow
  {
    gtk_overlay_reorder_overlay(cast(GtkOverlay*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, index);
  }

  /**
      Convenience function to set the value of the #GtkOverlay:pass-through
      child property for widget.
  
      Params:
        widget = an overlay child of #GtkOverlay
        passThrough = whether the child should pass the input through
  */
  void setOverlayPassThrough(gid.gtk3.widget.Widget widget, bool passThrough) nothrow
  {
    gtk_overlay_set_overlay_pass_through(cast(GtkOverlay*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, passThrough);
  }

  /**
      Connect to `GetChildPosition` signal.
  
      The ::get-child-position signal is emitted to determine
        the position and size of any overlay child widgets. A
        handler for this signal should fill allocation with
        the desired position and size for widget, relative to
        the 'main' child of overlay.
        
        The default handler for this signal uses the widget's
        halign and valign properties to determine the position
        and gives the widget its natural size (except that an
        alignment of [gid.gtk4.types.Align.Fill] will cause the overlay to
        be full-width/height). If the main child is a
        #GtkScrolledWindow, the overlays are placed relative
        to its contents.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk3.widget.Widget widget, out gid.gdk3.rectangle.Rectangle allocation, gid.gtk3.overlay.Overlay overlay)`
  
          `widget` the child widget to position (optional)
  
          `allocation` return
              location for the allocation (optional)
  
          `overlay` the instance the signal is connected to (optional)
  
          `Returns` true if the allocation has been filled
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectGetChildPosition(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.out_ && is(Parameters!T[1] == gid.gdk3.rectangle.Rectangle)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.overlay.Overlay)))
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

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.overlay.Overlay.getChildPosition");
      }

      setVal!(bool)(_returnValue, _retval);

      static if (Parameters!T.length > 1)
      {
        if (auto _p = getVal!(Parameters!T[1]*)(&_paramVals[2]))
          *_p = _paramTuple[1];
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("get-child-position", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Overlay
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.overlay.Overlay), T.stringof ~ " is not derived from gid.gtk3.overlay.Overlay");

    gid.gtk3.container.Container._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetChildPosition", true)[0]) == gid.gtk3.overlay.Overlay))
      _installVfunc(klass, "get_child_position");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkOverlayClass*)klass;

    switch (vfunc)
    {
      case "get_child_position":
      {
        static extern(C) gboolean _vfuncGetChildPositionTramp(GtkOverlay* overlay, GtkWidget* widget, GtkAllocation* allocation) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.overlay.Overlay)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)overlay);
          if (!_obj)
          {
            auto _klass = cast(GtkOverlayClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)overlay);
            if (_klass.getChildPosition)
              return (cast(typeof(&_vfuncGetChildPositionTramp))_klass.getChildPosition)(overlay, widget, allocation);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncGetChildPosition(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)widget, No.Take), *cast(gid.gtk3.types.Allocation*)allocation);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.overlay.Overlay.vfuncGetChildPosition");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.getChildPosition = cast(typeof(_klass.getChildPosition))&_vfuncGetChildPositionTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.overlay.Overlay]
class OverlayGidBuilderImpl(T) : gid.gtk3.bin.BinGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.overlay.Overlay]
final class OverlayGidBuilder : OverlayGidBuilderImpl!OverlayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Overlay build() nothrow
  {
    return new Overlay(cast(void*)createGObject(Overlay._getGType), Yes.Take);
  }
}
