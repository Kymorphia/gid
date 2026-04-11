/// Module for [StyleSchemeChooserWidget] class
module gtksource.style_scheme_chooser_widget;

import gid.gid;
import gobject.gid_builder;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.style_scheme_chooser;
import gtksource.style_scheme_chooser_mixin;
import gtksource.types;

/**
    A widget for choosing style schemes.
    
    The [gtksource.style_scheme_chooser_widget.StyleSchemeChooserWidget] widget lets the user select a
    style scheme. By default, the chooser presents a predefined list
    of style schemes.
    
    To change the initially selected style scheme,
    use [gtksource.style_scheme_chooser.StyleSchemeChooser.setStyleScheme].
    To get the selected style scheme
    use [gtksource.style_scheme_chooser.StyleSchemeChooser.getStyleScheme].
*/
class StyleSchemeChooserWidget : gtk.widget.Widget, gtksource.style_scheme_chooser.StyleSchemeChooser
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
    return cast(void function())gtk_source_style_scheme_chooser_widget_get_type != &gidSymbolNotFound ? gtk_source_style_scheme_chooser_widget_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StyleSchemeChooserWidget self()
  {
    return this;
  }

  /**
      Get builder for [gtksource.style_scheme_chooser_widget.StyleSchemeChooserWidget]
      Returns: New builder object
  */
  static StyleSchemeChooserWidgetGidBuilder builder()
  {
    return new StyleSchemeChooserWidgetGidBuilder;
  }

  mixin StyleSchemeChooserT!();

  /**
      Creates a new #GtkSourceStyleSchemeChooserWidget.
      Returns: a new  #GtkSourceStyleSchemeChooserWidget.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_source_style_scheme_chooser_widget_new();
    this(_cretval, No.Take);
  }
}

/// Fluent builder implementation template for [gtksource.style_scheme_chooser_widget.StyleSchemeChooserWidget]
class StyleSchemeChooserWidgetGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T, gtksource.style_scheme_chooser.StyleSchemeChooserGidBuilderImpl!T
{

  mixin StyleSchemeChooserGidBuilderT!();
}

/// Fluent builder for [gtksource.style_scheme_chooser_widget.StyleSchemeChooserWidget]
final class StyleSchemeChooserWidgetGidBuilder : StyleSchemeChooserWidgetGidBuilderImpl!StyleSchemeChooserWidgetGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StyleSchemeChooserWidget build()
  {
    return new StyleSchemeChooserWidget(cast(void*)createGObject(StyleSchemeChooserWidget._getGType), No.Take);
  }
}
