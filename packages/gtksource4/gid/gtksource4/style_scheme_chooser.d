/// Module for [StyleSchemeChooser] interface
module gid.gtksource4.style_scheme_chooser;

public import gid.core.basictypes;
public import gid.gtksource4.style_scheme_chooser_iface_proxy;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtksource4.c.functions;
import gid.gtksource4.c.types;
import gid.gtksource4.style_scheme;
import gid.gtksource4.types;

/** */
interface StyleSchemeChooser : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_style_scheme_chooser_get_type != &gidSymbolNotFound ? gtk_source_style_scheme_chooser_get_type() : cast(GType)0;
  }

  /**
      Get `styleScheme` property.
      Returns: The :style-scheme property contains the currently selected style
        scheme. The property can be set to change
        the current selection programmatically.
  */
  @property gid.gtksource4.style_scheme.StyleScheme styleScheme() nothrow;

  /**
      Set `styleScheme` property.
      Params:
        propval = The :style-scheme property contains the currently selected style
          scheme. The property can be set to change
          the current selection programmatically.
  */
  @property void styleScheme(gid.gtksource4.style_scheme.StyleScheme propval) nothrow;



  /**
      Gets the currently-selected scheme.
      Returns: the currently-selected scheme.
  */
  gid.gtksource4.style_scheme.StyleScheme getStyleScheme();

  /**
      Sets the scheme.
  
      Params:
        scheme = a #GtkSourceStyleScheme
  */
  void setStyleScheme(gid.gtksource4.style_scheme.StyleScheme scheme);
}

/// Fluent builder implementation template for [gid.gtksource4.style_scheme_chooser.StyleSchemeChooser]
interface StyleSchemeChooserGidBuilderImpl(T)
{

  /**
      Set `styleScheme` property.
      Params:
        propval = The :style-scheme property contains the currently selected style
          scheme. The property can be set to change
          the current selection programmatically.
      Returns: Builder instance for fluent chaining
  */
  T styleScheme(gid.gtksource4.style_scheme.StyleScheme propval) nothrow;
}
