/// Module for [StyleSchemeChooserWidget] class
module gtksource.style_scheme_chooser_widget;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.style_scheme_chooser;
import gtksource.style_scheme_chooser_mixin;
import gtksource.types;

/** */
class StyleSchemeChooserWidget : gtk.bin.Bin, gtksource.style_scheme_chooser.StyleSchemeChooser
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
class StyleSchemeChooserWidgetGidBuilderImpl(T) : gtk.bin.BinGidBuilderImpl!T, gtksource.style_scheme_chooser.StyleSchemeChooserGidBuilderImpl!T
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
