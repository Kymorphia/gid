/// Module for [SpinnerPaintable] class
module adw.spinner_paintable;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gdk.paintable;
import gdk.paintable_mixin;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.symbolic_paintable;
import gtk.symbolic_paintable_mixin;
import gtk.widget;

/**
    A paintable showing a loading spinner.
    
    <picture>
      <source srcset="spinner-dark.png" media="(prefers-color-scheme: dark)">
      <img src="spinner.png" alt="spinner">
    </picture>
    
    [adw.spinner_paintable.SpinnerPaintable] size varies depending on the available space, but is
    capped at 64×64 pixels.
    
    To be able to animate, [adw.spinner_paintable.SpinnerPaintable] needs a widget. It will be
    animated according to that widget's frame clock, and only if that widget is
    mapped. Ideally it should be the same widget the paintable is displayed in,
    but that's not a requirement.
    
    Most applications should be using [adw.spinner.Spinner] instead.
    [adw.spinner_paintable.SpinnerPaintable] is provided for the cases where using a widget is
    impractical or impossible, such as [adw.status_page.StatusPage.paintable]:
    
    ```xml
    <object class="AdwStatusPage" id="status_page">
      <property name="paintable">
        <object class="AdwSpinnerPaintable">
          <property name="widget">status_page</property>
        </object>
      </property>
      <!-- ... -->
    </object>
    ```
*/
class SpinnerPaintable : gobject.object.ObjectWrap, gdk.paintable.Paintable, gtk.symbolic_paintable.SymbolicPaintable
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_spinner_paintable_get_type != &gidSymbolNotFound ? adw_spinner_paintable_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SpinnerPaintable self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.spinner_paintable.SpinnerPaintable]
      Returns: New builder object
  */
  static SpinnerPaintableGidBuilder builder() nothrow
  {
    return new SpinnerPaintableGidBuilder;
  }

  /**
      Get `widget` property.
      Returns: The widget the spinner uses for frame clock.
  */
  @property gtk.widget.Widget widget() nothrow
  {
    return getWidget();
  }

  /**
      Set `widget` property.
      Params:
        propval = The widget the spinner uses for frame clock.
  */
  @property void widget(gtk.widget.Widget propval) nothrow
  {
    setWidget(propval);
  }

  mixin PaintableT!();
  mixin SymbolicPaintableT!();

  /**
      Creates a new [adw.spinner_paintable.SpinnerPaintable] for widget.
  
      Params:
        widget = the widget used for frame clock
      Returns: the newly created [adw.spinner_paintable.SpinnerPaintable]
  */
  this(gtk.widget.Widget widget = null) nothrow
  {
    AdwSpinnerPaintable* _cretval;
    _cretval = adw_spinner_paintable_new(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the widget used for frame clock.
      Returns: the widget
  */
  gtk.widget.Widget getWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_spinner_paintable_get_widget(cast(AdwSpinnerPaintable*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the widget used for frame clock.
  
      Params:
        widget = the widget to use for frame clock
  */
  void setWidget(gtk.widget.Widget widget = null) nothrow
  {
    adw_spinner_paintable_set_widget(cast(AdwSpinnerPaintable*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [adw.spinner_paintable.SpinnerPaintable]
class SpinnerPaintableGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gdk.paintable.PaintableGidBuilderImpl!T, gtk.symbolic_paintable.SymbolicPaintableGidBuilderImpl!T
{

  mixin PaintableGidBuilderT!();
  mixin SymbolicPaintableGidBuilderT!();

  /**
      Set `widget` property.
      Params:
        propval = The widget the spinner uses for frame clock.
      Returns: Builder instance for fluent chaining
  */
  T widget(gtk.widget.Widget propval) nothrow
  {
    return setProperty("widget", propval);
  }
}

/// Fluent builder for [adw.spinner_paintable.SpinnerPaintable]
final class SpinnerPaintableGidBuilder : SpinnerPaintableGidBuilderImpl!SpinnerPaintableGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SpinnerPaintable build() nothrow
  {
    return new SpinnerPaintable(cast(void*)createGObject(SpinnerPaintable._getGType), Yes.Take);
  }
}
