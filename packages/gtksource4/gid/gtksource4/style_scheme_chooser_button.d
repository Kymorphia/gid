/// Module for [StyleSchemeChooserButton] class
module gid.gtksource4.style_scheme_chooser_button;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.actionable;
import gid.gtk3.actionable_mixin;
import gid.gtk3.activatable;
import gid.gtk3.activatable_mixin;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.button;
import gid.gtksource4.c.functions;
import gid.gtksource4.c.types;
import gid.gtksource4.style_scheme_chooser;
import gid.gtksource4.style_scheme_chooser_mixin;
import gid.gtksource4.types;

/** */
class StyleSchemeChooserButton : gid.gtk3.button.Button, gid.gtksource4.style_scheme_chooser.StyleSchemeChooser
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
    return cast(void function())gtk_source_style_scheme_chooser_button_get_type != &gidSymbolNotFound ? gtk_source_style_scheme_chooser_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceStyleSchemeChooserButton";
  }

  /** Returns `this`, for use in `with` statements. */
  override StyleSchemeChooserButton self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource4.style_scheme_chooser_button.StyleSchemeChooserButton]
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
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_source_style_scheme_chooser_button_new();
      this(_cretval, No.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtksource4.style_scheme_chooser_button.StyleSchemeChooserButton]
class StyleSchemeChooserButtonGidBuilderImpl(T) : gid.gtk3.button.ButtonGidBuilderImpl!T, gid.gtksource4.style_scheme_chooser.StyleSchemeChooserGidBuilderImpl!T
{

  mixin StyleSchemeChooserGidBuilderT!();
}

/// Fluent builder for [gid.gtksource4.style_scheme_chooser_button.StyleSchemeChooserButton]
final class StyleSchemeChooserButtonGidBuilder : StyleSchemeChooserButtonGidBuilderImpl!StyleSchemeChooserButtonGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StyleSchemeChooserButton build() nothrow
  {
    return new StyleSchemeChooserButton(cast(void*)createGObject(StyleSchemeChooserButton._getGType), Yes.Take);
  }
}
