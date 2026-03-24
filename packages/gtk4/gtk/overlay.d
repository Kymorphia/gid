/// Module for [Overlay] class
module gtk.overlay;

import gdk.rectangle;
import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.overlay.Overlay] is a container which contains a single main child, on top
    of which it can place “overlay” widgets.
    
    ![An example GtkOverlay](overlay.png)
    
    The position of each overlay widget is determined by its
    [gtk.widget.Widget.halign] and [gtk.widget.Widget.valign]
    properties. E.g. a widget with both alignments set to [gtk.types.Align.Start]
    will be placed at the top left corner of the [gtk.overlay.Overlay] container,
    whereas an overlay with halign set to [gtk.types.Align.Center] and valign set
    to [gtk.types.Align.End] will be placed a the bottom edge of the [gtk.overlay.Overlay],
    horizontally centered. The position can be adjusted by setting the margin
    properties of the child to non-zero values.
    
    More complicated placement of overlays is possible by connecting
    to the `signal@Gtk.Overlay::get-child-position` signal.
    
    An overlay’s minimum and natural sizes are those of its main child.
    The sizes of overlay children are not considered when measuring these
    preferred sizes.
    
    # GtkOverlay as GtkBuildable
    
    The [gtk.overlay.Overlay] implementation of the [gtk.buildable.Buildable] interface
    supports placing a child as an overlay by specifying “overlay” as
    the “type” attribute of a `<child>` element.
    
    # CSS nodes
    
    [gtk.overlay.Overlay] has a single CSS node with the name “overlay”. Overlay children
    whose alignments cause them to be positioned at an edge get the style classes
    “.left”, “.right”, “.top”, and/or “.bottom” according to their position.
*/
class Overlay : gtk.widget.Widget
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
    return cast(void function())gtk_overlay_get_type != &gidSymbolNotFound ? gtk_overlay_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Overlay self()
  {
    return this;
  }

  /**
  Get builder for [gtk.overlay.Overlay]
  Returns: New builder object
  */
  static OverlayGidBuilder builder()
  {
    return new OverlayGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The main child widget.
  */
  @property gtk.widget.Widget child()
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The main child widget.
  */
  @property void child(gtk.widget.Widget propval)
  {
    setChild(propval);
  }

  /**
      Creates a new [gtk.overlay.Overlay].
      Returns: a new [gtk.overlay.Overlay] object.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_overlay_new();
    this(_cretval, No.Take);
  }

  /**
      Adds widget to overlay.
      
      The widget will be stacked on top of the main widget
      added with [gtk.overlay.Overlay.setChild].
      
      The position at which widget is placed is determined
      from its [gtk.widget.Widget.halign] and
      [gtk.widget.Widget.valign] properties.
  
      Params:
        widget = a [gtk.widget.Widget] to be added to the container
  */
  void addOverlay(gtk.widget.Widget widget)
  {
    gtk_overlay_add_overlay(cast(GtkOverlay*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Gets the child widget of overlay.
      Returns: the child widget of overlay
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_overlay_get_child(cast(GtkOverlay*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether widget should be clipped within the parent.
  
      Params:
        widget = an overlay child of [gtk.overlay.Overlay]
      Returns: whether the widget is clipped within the parent.
  */
  bool getClipOverlay(gtk.widget.Widget widget)
  {
    bool _retval;
    _retval = cast(bool)gtk_overlay_get_clip_overlay(cast(GtkOverlay*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets whether widget's size is included in the measurement of
      overlay.
  
      Params:
        widget = an overlay child of [gtk.overlay.Overlay]
      Returns: whether the widget is measured
  */
  bool getMeasureOverlay(gtk.widget.Widget widget)
  {
    bool _retval;
    _retval = cast(bool)gtk_overlay_get_measure_overlay(cast(GtkOverlay*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Removes an overlay that was added with [gtk.overlay.Overlay.addOverlay].
  
      Params:
        widget = a [gtk.widget.Widget] to be removed
  */
  void removeOverlay(gtk.widget.Widget widget)
  {
    gtk_overlay_remove_overlay(cast(GtkOverlay*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets the child widget of overlay.
  
      Params:
        child = the child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    gtk_overlay_set_child(cast(GtkOverlay*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets whether widget should be clipped within the parent.
  
      Params:
        widget = an overlay child of [gtk.overlay.Overlay]
        clipOverlay = whether the child should be clipped
  */
  void setClipOverlay(gtk.widget.Widget widget, bool clipOverlay)
  {
    gtk_overlay_set_clip_overlay(cast(GtkOverlay*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, clipOverlay);
  }

  /**
      Sets whether widget is included in the measured size of overlay.
      
      The overlay will request the size of the largest child that has
      this property set to true. Children who are not included may
      be drawn outside of overlay's allocation if they are too large.
  
      Params:
        widget = an overlay child of [gtk.overlay.Overlay]
        measure = whether the child should be measured
  */
  void setMeasureOverlay(gtk.widget.Widget widget, bool measure)
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
        alignment of [gtk.types.Align.Fill] will cause the overlay to
        be full-width/height). If the main child is a
        [gtk.scrolled_window.ScrolledWindow], the overlays are placed relative
        to its contents.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.widget.Widget widget, out gdk.rectangle.Rectangle allocation, gtk.overlay.Overlay overlay))
  
          `widget` the child widget to position (optional)
  
          `allocation` return
              location for the allocation (optional)
  
          `overlay` the instance the signal is connected to (optional)
  
          `Returns` true if the allocation has been filled
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectGetChildPosition(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.widget.Widget)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.out_ && is(Parameters!T[1] == gdk.rectangle.Rectangle)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.overlay.Overlay)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      Parameters!T[1] allocation;

      static if (Parameters!T.length > 1)
        _paramTuple[1] = allocation;

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);

      setVal!(bool)(_returnValue, _retval);

      static if (Parameters!T.length > 1)
        *getVal!(Parameters!T[1]*)(&_paramVals[2]) = allocation;
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("get-child-position", closure, after);
  }
}

class OverlayGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `child` property.
      Params:
        propval = The main child widget.
      Returns: Builder instance for fluent chaining
  */
  T child(gtk.widget.Widget propval)
  {
    return setProperty("child", propval);
  }
}

/// Fluent builder for [gtk.overlay.Overlay]
final class OverlayGidBuilder : OverlayGidBuilderImpl!OverlayGidBuilder
{
  Overlay build()
  {
    return new Overlay(cast(void*)createGObject(Overlay._getGType), No.Take);
  }
}
