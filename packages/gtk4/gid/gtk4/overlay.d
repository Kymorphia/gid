/// Module for [Overlay] class
module gid.gtk4.overlay;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.rectangle;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Places “overlay” widgets on top of a single main child.
    
    <picture>
      <source srcset="overlay-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkOverlay" src="overlay.png">
    </picture>
    
    The position of each overlay widget is determined by its
    [gid.gtk4.widget.Widget.halign] and [gid.gtk4.widget.Widget.valign]
    properties. E.g. a widget with both alignments set to [gid.gtk4.types.Align.Start]
    will be placed at the top left corner of the [gid.gtk4.overlay.Overlay] container,
    whereas an overlay with halign set to [gid.gtk4.types.Align.Center] and valign set
    to [gid.gtk4.types.Align.End] will be placed a the bottom edge of the [gid.gtk4.overlay.Overlay],
    horizontally centered. The position can be adjusted by setting the margin
    properties of the child to non-zero values.
    
    More complicated placement of overlays is possible by connecting
    to the [gid.gtk4.overlay.Overlay.getChildPosition] signal.
    
    An overlay’s minimum and natural sizes are those of its main child.
    The sizes of overlay children are not considered when measuring these
    preferred sizes.
    
    # GtkOverlay as GtkBuildable
    
    The [gid.gtk4.overlay.Overlay] implementation of the [gid.gtk4.buildable.Buildable] interface
    supports placing a child as an overlay by specifying “overlay” as
    the “type” attribute of a `<child>` element.
    
    # CSS nodes
    
    [gid.gtk4.overlay.Overlay] has a single CSS node with the name “overlay”. Overlay children
    whose alignments cause them to be positioned at an edge get the style classes
    “.left”, “.right”, “.top”, and/or “.bottom” according to their position.
*/
class Overlay : gid.gtk4.widget.Widget
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
      Get builder for [gid.gtk4.overlay.Overlay]
      Returns: New builder object
  */
  static OverlayGidBuilder builder() nothrow
  {
    return new OverlayGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The main child widget.
  */
  @property gid.gtk4.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The main child widget.
  */
  @property void child(gid.gtk4.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Creates a new [gid.gtk4.overlay.Overlay].
      Returns: a new [gid.gtk4.overlay.Overlay] object.
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
      Adds widget to overlay.
      
      The widget will be stacked on top of the main widget
      added with [gid.gtk4.overlay.Overlay.setChild].
      
      The position at which widget is placed is determined
      from its [gid.gtk4.widget.Widget.halign] and
      [gid.gtk4.widget.Widget.valign] properties.
  
      Params:
        widget = a [gid.gtk4.widget.Widget] to be added to the container
  */
  void addOverlay(gid.gtk4.widget.Widget widget) nothrow
  {
    gtk_overlay_add_overlay(cast(GtkOverlay*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Gets the child widget of overlay.
      Returns: the child widget of overlay
  */
  gid.gtk4.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_overlay_get_child(cast(GtkOverlay*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether widget should be clipped within the parent.
  
      Params:
        widget = an overlay child of [gid.gtk4.overlay.Overlay]
      Returns: whether the widget is clipped within the parent.
  */
  bool getClipOverlay(gid.gtk4.widget.Widget widget) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_overlay_get_clip_overlay(cast(GtkOverlay*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets whether widget's size is included in the measurement of
      overlay.
  
      Params:
        widget = an overlay child of [gid.gtk4.overlay.Overlay]
      Returns: whether the widget is measured
  */
  bool getMeasureOverlay(gid.gtk4.widget.Widget widget) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_overlay_get_measure_overlay(cast(GtkOverlay*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Removes an overlay that was added with [gid.gtk4.overlay.Overlay.addOverlay].
  
      Params:
        widget = a [gid.gtk4.widget.Widget] to be removed
  */
  void removeOverlay(gid.gtk4.widget.Widget widget) nothrow
  {
    gtk_overlay_remove_overlay(cast(GtkOverlay*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets the child widget of overlay.
  
      Params:
        child = the child widget
  */
  void setChild(gid.gtk4.widget.Widget child = null) nothrow
  {
    gtk_overlay_set_child(cast(GtkOverlay*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets whether widget should be clipped within the parent.
  
      Params:
        widget = an overlay child of [gid.gtk4.overlay.Overlay]
        clipOverlay = whether the child should be clipped
  */
  void setClipOverlay(gid.gtk4.widget.Widget widget, bool clipOverlay) nothrow
  {
    gtk_overlay_set_clip_overlay(cast(GtkOverlay*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, clipOverlay);
  }

  /**
      Sets whether widget is included in the measured size of overlay.
      
      The overlay will request the size of the largest child that has
      this property set to true. Children who are not included may
      be drawn outside of overlay's allocation if they are too large.
  
      Params:
        widget = an overlay child of [gid.gtk4.overlay.Overlay]
        measure = whether the child should be measured
  */
  void setMeasureOverlay(gid.gtk4.widget.Widget widget, bool measure) nothrow
  {
    gtk_overlay_set_measure_overlay(cast(GtkOverlay*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, measure);
  }

  /**
      Connect to `GetChildPosition` signal.
  
      Emitted to determine the position and size of any overlay
        child widgets.
        
        A handler for this signal should fill allocation with
        the desired position and size for widget, relative to
        the 'main' child of overlay.
        
        The default handler for this signal uses the widget's
        halign and valign properties to determine the position
        and gives the widget its natural size (except that an
        alignment of [gid.gtk4.types.Align.Fill] will cause the overlay to
        be full-width/height). If the main child is a
        [gid.gtk4.scrolled_window.ScrolledWindow], the overlays are placed relative
        to its contents.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk4.widget.Widget widget, out gid.gdk4.rectangle.Rectangle allocation, gid.gtk4.overlay.Overlay overlay)`
  
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
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.out_ && is(Parameters!T[1] == gid.gdk4.rectangle.Rectangle)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.overlay.Overlay)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.overlay.Overlay.getChildPosition");
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
}

/// Fluent builder implementation template for [gid.gtk4.overlay.Overlay]
class OverlayGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `child` property.
      Params:
        propval = The main child widget.
      Returns: Builder instance for fluent chaining
  */
  T child(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }
}

/// Fluent builder for [gid.gtk4.overlay.Overlay]
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
