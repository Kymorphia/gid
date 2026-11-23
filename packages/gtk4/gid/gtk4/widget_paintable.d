/// Module for [WidgetPaintable] class
module gid.gtk4.widget_paintable;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.paintable;
import gid.gdk4.paintable_mixin;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    A [gid.gdk4.paintable.Paintable] that displays the contents of a widget.
    
    [gid.gtk4.widget_paintable.WidgetPaintable] will also take care of the widget not being in a
    state where it can be drawn (like when it isn't shown) and just draw
    nothing or where it does not have a size (like when it is hidden) and
    report no size in that case.
    
    Of course, [gid.gtk4.widget_paintable.WidgetPaintable] allows you to monitor widgets for size
    changes by emitting the [gid.gdk4.paintable.Paintable.invalidateSize] signal
    whenever the size of the widget changes as well as for visual changes by
    emitting the [gid.gdk4.paintable.Paintable.invalidateContents] signal whenever
    the widget changes.
    
    You can use a [gid.gtk4.widget_paintable.WidgetPaintable] everywhere a [gid.gdk4.paintable.Paintable] is allowed,
    including using it on a [gid.gtk4.picture.Picture] (or one of its parents) that it was
    set on itself via [gid.gtk4.picture.Picture.setPaintable]. The paintable will take care
    of recursion when this happens. If you do this however, ensure that the
    [gid.gtk4.picture.Picture.canShrink] property is set to true or you might
    end up with an infinitely growing widget.
*/
class WidgetPaintable : gid.gobject2.object.ObjectWrap, gid.gdk4.paintable.Paintable
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
    return cast(void function())gtk_widget_paintable_get_type != &gidSymbolNotFound ? gtk_widget_paintable_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkWidgetPaintable";
  }

  /** Returns `this`, for use in `with` statements. */
  override WidgetPaintable self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.widget_paintable.WidgetPaintable]
      Returns: New builder object
  */
  static WidgetPaintableGidBuilder builder() nothrow
  {
    return new WidgetPaintableGidBuilder;
  }

  /**
      Get `widget` property.
      Returns: The observed widget or null if none.
  */
  @property gid.gtk4.widget.Widget widget() nothrow
  {
    return getWidget();
  }

  /**
      Set `widget` property.
      Params:
        propval = The observed widget or null if none.
  */
  @property void widget(gid.gtk4.widget.Widget propval) nothrow
  {
    setWidget(propval);
  }

  mixin PaintableT!();

  /**
      Creates a new widget paintable observing the given widget.
  
      Params:
        widget = a [gid.gtk4.widget.Widget]
      Returns: a new [gid.gtk4.widget_paintable.WidgetPaintable]
  */
  this(gid.gtk4.widget.Widget widget = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, widget !is null), Yes.Take);
    }
    else
    {
      GdkPaintable* _cretval;
      _cretval = gtk_widget_paintable_new(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Returns the widget that is observed or null if none.
      Returns: the observed widget.
  */
  gid.gtk4.widget.Widget getWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_paintable_get_widget(cast(GtkWidgetPaintable*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the widget that should be observed.
  
      Params:
        widget = the widget to observe
  */
  void setWidget(gid.gtk4.widget.Widget widget = null) nothrow
  {
    gtk_widget_paintable_set_widget(cast(GtkWidgetPaintable*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.widget_paintable.WidgetPaintable]
class WidgetPaintableGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gdk4.paintable.PaintableGidBuilderImpl!T
{

  mixin PaintableGidBuilderT!();

  /**
      Set `widget` property.
      Params:
        propval = The observed widget or null if none.
      Returns: Builder instance for fluent chaining
  */
  T widget(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("widget", propval);
  }
}

/// Fluent builder for [gid.gtk4.widget_paintable.WidgetPaintable]
final class WidgetPaintableGidBuilder : WidgetPaintableGidBuilderImpl!WidgetPaintableGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WidgetPaintable build() nothrow
  {
    return new WidgetPaintable(cast(void*)createGObject(WidgetPaintable._getGType), Yes.Take);
  }
}
