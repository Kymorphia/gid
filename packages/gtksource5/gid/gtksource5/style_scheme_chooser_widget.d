/// Module for [StyleSchemeChooserWidget] class
module gid.gtksource5.style_scheme_chooser_widget;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.widget;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.style_scheme_chooser;
import gid.gtksource5.style_scheme_chooser_mixin;
import gid.gtksource5.types;

/**
    A widget for choosing style schemes.
    
    The [gid.gtksource5.style_scheme_chooser_widget.StyleSchemeChooserWidget] widget lets the user select a
    style scheme. By default, the chooser presents a predefined list
    of style schemes.
    
    To change the initially selected style scheme,
    use [gid.gtksource5.style_scheme_chooser.StyleSchemeChooser.setStyleScheme].
    To get the selected style scheme
    use [gid.gtksource5.style_scheme_chooser.StyleSchemeChooser.getStyleScheme].
*/
class StyleSchemeChooserWidget : gid.gtk4.widget.Widget, gid.gtksource5.style_scheme_chooser.StyleSchemeChooser
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
      Get builder for [gid.gtksource5.style_scheme_chooser_widget.StyleSchemeChooserWidget]
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
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_source_style_scheme_chooser_widget_new();
      this(_cretval, No.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtksource5.style_scheme_chooser_widget.StyleSchemeChooserWidget]
class StyleSchemeChooserWidgetGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtksource5.style_scheme_chooser.StyleSchemeChooserGidBuilderImpl!T
{

  mixin StyleSchemeChooserGidBuilderT!();
}

/// Fluent builder for [gid.gtksource5.style_scheme_chooser_widget.StyleSchemeChooserWidget]
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
