/// Module for [StyleSchemeChooserButton] class
module gid.gtksource5.style_scheme_chooser_button;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.actionable;
import gid.gtk4.actionable_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.button;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.style_scheme_chooser;
import gid.gtksource5.style_scheme_chooser_mixin;
import gid.gtksource5.types;

/**
    A button to launch a style scheme selection dialog.
    
    The [gid.gtksource5.style_scheme_chooser_button.StyleSchemeChooserButton] is a button which displays
    the currently selected style scheme and allows to open a style scheme
    selection dialog to change the style scheme.
    It is suitable widget for selecting a style scheme in a preference dialog.
    
    In [gid.gtksource5.style_scheme_chooser_button.StyleSchemeChooserButton], a [gid.gtksource5.style_scheme_chooser_widget.StyleSchemeChooserWidget]
    is used to provide a dialog for selecting style schemes.
*/
@gidGir("StyleSchemeChooserButton", "StyleSchemeChooserButtonClass")
class StyleSchemeChooserButton : gid.gtk4.button.Button, gid.gtksource5.style_scheme_chooser.StyleSchemeChooser
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
      Get builder for [gid.gtksource5.style_scheme_chooser_button.StyleSchemeChooserButton]
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
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
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

/// Fluent builder implementation template for [gid.gtksource5.style_scheme_chooser_button.StyleSchemeChooserButton]
class StyleSchemeChooserButtonGidBuilderImpl(T) : gid.gtk4.button.ButtonGidBuilderImpl!T, gid.gtksource5.style_scheme_chooser.StyleSchemeChooserGidBuilderImpl!T
{

  mixin StyleSchemeChooserGidBuilderT!();
}

/// Fluent builder for [gid.gtksource5.style_scheme_chooser_button.StyleSchemeChooserButton]
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
