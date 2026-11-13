/// Module for [Spinner] class
module adw.spinner;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.gid_builder;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    A widget showing a loading spinner.
    
    <picture>
      <source srcset="spinner-dark.png" media="(prefers-color-scheme: dark)">
      <img src="spinner.png" alt="spinner">
    </picture>
    
    The size of the spinner depends on the available size, never smaller than
    16×16 pixels and never larger than 64×64 pixels.
    
    Use the [gtk.widget.Widget.halign] and [gtk.widget.Widget.valign]
    properties in combination with [gtk.widget.Widget.widthRequest] and
    [gtk.widget.Widget.heightRequest] for fine sizing control.
    
    For example, the following snippet shows the spinner at 48×48 pixels:
    
    ```xml
    <object class="AdwSpinner">
      <property name="halign">center</property>
      <property name="valign">center</property>
      <property name="width-request">48</property>
      <property name="height-request">48</property>
    </object>
    ```
    
    See [adw.spinner_paintable.SpinnerPaintable] for cases where using a widget is impractical or
    impossible, such as [adw.status_page.StatusPage.paintable].
    
    ## CSS nodes
    
    [adw.spinner.Spinner] has a single node with the name `image` and the style class
    `.spinner`.
    
    ## Accessibility
    
    [adw.spinner.Spinner] uses the `enum@Gtk.AccessibleRole.progress-bar` role.
*/
class Spinner : gtk.widget.Widget
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_spinner_get_type != &gidSymbolNotFound ? adw_spinner_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwSpinner";
  }

  /** Returns `this`, for use in `with` statements. */
  override Spinner self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.spinner.Spinner]
      Returns: New builder object
  */
  static SpinnerGidBuilder builder() nothrow
  {
    return new SpinnerGidBuilder;
  }

  /**
      Creates a new [adw.spinner.Spinner].
      Returns: the newly created [adw.spinner.Spinner]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_spinner_new();
    this(_cretval, No.Take);
  }
}

/// Fluent builder implementation template for [adw.spinner.Spinner]
class SpinnerGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{

}

/// Fluent builder for [adw.spinner.Spinner]
final class SpinnerGidBuilder : SpinnerGidBuilderImpl!SpinnerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Spinner build() nothrow
  {
    return new Spinner(cast(void*)createGObject(Spinner._getGType), Yes.Take);
  }
}
