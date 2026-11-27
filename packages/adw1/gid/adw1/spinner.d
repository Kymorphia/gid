/// Module for [Spinner] class
module gid.adw1.spinner;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.widget;

/**
    A widget showing a loading spinner.
    
    <picture>
      <source srcset="spinner-dark.png" media="(prefers-color-scheme: dark)">
      <img src="spinner.png" alt="spinner">
    </picture>
    
    The size of the spinner depends on the available size, never smaller than
    16×16 pixels and never larger than 64×64 pixels.
    
    Use the [gid.gtk4.widget.Widget.halign] and [gid.gtk4.widget.Widget.valign]
    properties in combination with [gid.gtk4.widget.Widget.widthRequest] and
    [gid.gtk4.widget.Widget.heightRequest] for fine sizing control.
    
    For example, the following snippet shows the spinner at 48×48 pixels:
    
    ```xml
    <object class="AdwSpinner">
      <property name="halign">center</property>
      <property name="valign">center</property>
      <property name="width-request">48</property>
      <property name="height-request">48</property>
    </object>
    ```
    
    See [gid.adw1.spinner_paintable.SpinnerPaintable] for cases where using a widget is impractical or
    impossible, such as [gid.adw1.status_page.StatusPage.paintable].
    
    ## CSS nodes
    
    [gid.adw1.spinner.Spinner] has a single node with the name `image` and the style class
    `.spinner`.
    
    ## Accessibility
    
    [gid.adw1.spinner.Spinner] uses the `enum@Gtk.AccessibleRole.progress-bar` role.
*/
@gidGir("Spinner", "SpinnerClass")
class Spinner : gid.gtk4.widget.Widget
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
      Get builder for [gid.adw1.spinner.Spinner]
      Returns: New builder object
  */
  static SpinnerGidBuilder builder() nothrow
  {
    return new SpinnerGidBuilder;
  }

  /**
      Creates a new [gid.adw1.spinner.Spinner].
      Returns: the newly created [gid.adw1.spinner.Spinner]
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
      _cretval = adw_spinner_new();
      this(_cretval, No.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.adw1.spinner.Spinner]
class SpinnerGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{

}

/// Fluent builder for [gid.adw1.spinner.Spinner]
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
