/// Module for [StyleSchemeChooserWidget] class
module gid.gtksource4.style_scheme_chooser_widget;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.bin;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtksource4.c.functions;
import gid.gtksource4.c.types;
import gid.gtksource4.style_scheme_chooser;
import gid.gtksource4.style_scheme_chooser_mixin;
import gid.gtksource4.types;

/** */
class StyleSchemeChooserWidget : gid.gtk3.bin.Bin, gid.gtksource4.style_scheme_chooser.StyleSchemeChooser
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
    return cast(void function())gtk_source_style_scheme_chooser_widget_get_type != &gidSymbolNotFound ? gtk_source_style_scheme_chooser_widget_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceStyleSchemeChooserWidget";
  }

  /** Returns `this`, for use in `with` statements. */
  override StyleSchemeChooserWidget self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource4.style_scheme_chooser_widget.StyleSchemeChooserWidget]
      Returns: New builder object
  */
  static StyleSchemeChooserWidgetGidBuilder builder() nothrow
  {
    return new StyleSchemeChooserWidgetGidBuilder;
  }

  mixin StyleSchemeChooserT!();

  /**
      Creates a new #GtkSourceStyleSchemeChooserWidget.
      Returns: a new  #GtkSourceStyleSchemeChooserWidget.
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_source_style_scheme_chooser_widget_new();
    this(_cretval, No.Take);
  }
}

/// Fluent builder implementation template for [gid.gtksource4.style_scheme_chooser_widget.StyleSchemeChooserWidget]
class StyleSchemeChooserWidgetGidBuilderImpl(T) : gid.gtk3.bin.BinGidBuilderImpl!T, gid.gtksource4.style_scheme_chooser.StyleSchemeChooserGidBuilderImpl!T
{

  mixin StyleSchemeChooserGidBuilderT!();
}

/// Fluent builder for [gid.gtksource4.style_scheme_chooser_widget.StyleSchemeChooserWidget]
final class StyleSchemeChooserWidgetGidBuilder : StyleSchemeChooserWidgetGidBuilderImpl!StyleSchemeChooserWidgetGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StyleSchemeChooserWidget build() nothrow
  {
    return new StyleSchemeChooserWidget(cast(void*)createGObject(StyleSchemeChooserWidget._getGType), Yes.Take);
  }
}
