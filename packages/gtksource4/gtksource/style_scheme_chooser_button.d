/// Module for [StyleSchemeChooserButton] class
module gtksource.style_scheme_chooser_button;

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
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_style_scheme_chooser_button_get_type != &gidSymbolNotFound ? gtk_source_style_scheme_chooser_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StyleSchemeChooserButton self()
  {
    return this;
  }

  /**
  Get builder for [gtksource.style_scheme_chooser_button.StyleSchemeChooserButton]
  Returns: New builder object
  */
  static StyleSchemeChooserButtonGidBuilder builder()
  {
    return new StyleSchemeChooserButtonGidBuilder;
  }

  mixin StyleSchemeChooserT!();

  /**
      Creates a new #GtkSourceStyleSchemeChooserButton.
      Returns: a new #GtkSourceStyleSchemeChooserButton.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_source_style_scheme_chooser_button_new();
    this(_cretval, No.Take);
  }
}

class StyleSchemeChooserButtonGidBuilderImpl(T) : gtk.button.ButtonGidBuilderImpl!T, gtksource.style_scheme_chooser.StyleSchemeChooserGidBuilderImpl!T
{

  mixin StyleSchemeChooserGidBuilderT!();
}

/// Fluent builder for [gtksource.style_scheme_chooser_button.StyleSchemeChooserButton]
final class StyleSchemeChooserButtonGidBuilder : StyleSchemeChooserButtonGidBuilderImpl!StyleSchemeChooserButtonGidBuilder
{
  StyleSchemeChooserButton build()
  {
    return new StyleSchemeChooserButton(cast(void*)createGObject(StyleSchemeChooserButton._getGType), No.Take);
  }
}
