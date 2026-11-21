/// Module for [SpinnerPaintable] class
module gid.adw1.spinner_paintable;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.core.gid;
import gid.gdk4.paintable;
import gid.gdk4.paintable_mixin;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.symbolic_paintable;
import gid.gtk4.symbolic_paintable_mixin;
import gid.gtk4.widget;

/**
    A paintable showing a loading spinner.
    
    <picture>
      <source srcset="spinner-dark.png" media="(prefers-color-scheme: dark)">
      <img src="spinner.png" alt="spinner">
    </picture>
    
    [gid.adw1.spinner_paintable.SpinnerPaintable] size varies depending on the available space, but is
    capped at 64×64 pixels.
    
    To be able to animate, [gid.adw1.spinner_paintable.SpinnerPaintable] needs a widget. It will be
    animated according to that widget's frame clock, and only if that widget is
    mapped. Ideally it should be the same widget the paintable is displayed in,
    but that's not a requirement.
    
    Most applications should be using [gid.adw1.spinner.Spinner] instead.
    [gid.adw1.spinner_paintable.SpinnerPaintable] is provided for the cases where using a widget is
    impractical or impossible, such as [gid.adw1.status_page.StatusPage.paintable]:
    
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
class SpinnerPaintable : gid.gobject2.object.ObjectWrap, gid.gdk4.paintable.Paintable, gid.gtk4.symbolic_paintable.SymbolicPaintable
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
    return cast(void function())adw_spinner_paintable_get_type != &gidSymbolNotFound ? adw_spinner_paintable_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwSpinnerPaintable";
  }

  /** Returns `this`, for use in `with` statements. */
  override SpinnerPaintable self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.spinner_paintable.SpinnerPaintable]
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
  @property gid.gtk4.widget.Widget widget() nothrow
  {
    return getWidget();
  }

  /**
      Set `widget` property.
      Params:
        propval = The widget the spinner uses for frame clock.
  */
  @property void widget(gid.gtk4.widget.Widget propval) nothrow
  {
    setWidget(propval);
  }

  mixin PaintableT!();
  mixin SymbolicPaintableT!();

  /**
      Creates a new [gid.adw1.spinner_paintable.SpinnerPaintable] for widget.
  
      Params:
        widget = the widget used for frame clock
      Returns: the newly created [gid.adw1.spinner_paintable.SpinnerPaintable]
  */
  this(gid.gtk4.widget.Widget widget = null) nothrow
  {
    AdwSpinnerPaintable* _cretval;
    _cretval = adw_spinner_paintable_new(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the widget used for frame clock.
      Returns: the widget
  */
  gid.gtk4.widget.Widget getWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_spinner_paintable_get_widget(cast(AdwSpinnerPaintable*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the widget used for frame clock.
  
      Params:
        widget = the widget to use for frame clock
  */
  void setWidget(gid.gtk4.widget.Widget widget = null) nothrow
  {
    adw_spinner_paintable_set_widget(cast(AdwSpinnerPaintable*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.adw1.spinner_paintable.SpinnerPaintable]
class SpinnerPaintableGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gdk4.paintable.PaintableGidBuilderImpl!T, gid.gtk4.symbolic_paintable.SymbolicPaintableGidBuilderImpl!T
{

  mixin PaintableGidBuilderT!();
  mixin SymbolicPaintableGidBuilderT!();

  /**
      Set `widget` property.
      Params:
        propval = The widget the spinner uses for frame clock.
      Returns: Builder instance for fluent chaining
  */
  T widget(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("widget", propval);
  }
}

/// Fluent builder for [gid.adw1.spinner_paintable.SpinnerPaintable]
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
