/// Module for [StyleSchemeChooserButton] class
module gtksource.style_scheme_chooser_button;

public import gid.basictypes;
import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.button;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.style_scheme_chooser;
import gtksource.style_scheme_chooser_mixin;
import gtksource.types;

/** */
class StyleSchemeChooserButton : gtk.button.Button, gtksource.style_scheme_chooser.StyleSchemeChooser
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
    return cast(void function())gtk_source_style_scheme_chooser_button_get_type != &gidSymbolNotFound ? gtk_source_style_scheme_chooser_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StyleSchemeChooserButton self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtksource.style_scheme_chooser_button.StyleSchemeChooserButton]
      Returns: New builder object
  */
  static StyleSchemeChooserButtonGidBuilder builder() nothrow
  {
    return new StyleSchemeChooserButtonGidBuilder;
  }

  mixin StyleSchemeChooserT!();

  /**
      Creates a new #GtkSourceStyleSchemeChooserButton.
      Returns: a new #GtkSourceStyleSchemeChooserButton.
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_source_style_scheme_chooser_button_new();
    this(_cretval, No.Take);
  }
}

/// Fluent builder implementation template for [gtksource.style_scheme_chooser_button.StyleSchemeChooserButton]
class StyleSchemeChooserButtonGidBuilderImpl(T) : gtk.button.ButtonGidBuilderImpl!T, gtksource.style_scheme_chooser.StyleSchemeChooserGidBuilderImpl!T
{

  mixin StyleSchemeChooserGidBuilderT!();
}

/// Fluent builder for [gtksource.style_scheme_chooser_button.StyleSchemeChooserButton]
final class StyleSchemeChooserButtonGidBuilder : StyleSchemeChooserButtonGidBuilderImpl!StyleSchemeChooserButtonGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StyleSchemeChooserButton build() nothrow
  {
    return new StyleSchemeChooserButton(cast(void*)createGObject(StyleSchemeChooserButton._getGType), No.Take);
  }
}
