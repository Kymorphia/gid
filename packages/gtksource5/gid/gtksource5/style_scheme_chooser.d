/// Module for [StyleSchemeChooser] interface
module gid.gtksource5.style_scheme_chooser;

public import gid.core.basictypes;
public import gid.gtksource5.style_scheme_chooser_iface_proxy;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.style_scheme;
import gid.gtksource5.types;

/**
    Interface implemented by widgets for choosing style schemes.
    
    [gid.gtksource5.style_scheme_chooser.StyleSchemeChooser] is an interface that is implemented by widgets
    for choosing style schemes.
    
    In GtkSourceView, the main widgets that implement this interface are
    [gid.gtksource5.style_scheme_chooser_widget.StyleSchemeChooserWidget] and [gid.gtksource5.style_scheme_chooser_button.StyleSchemeChooserButton].
*/
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
      Returns: Contains the currently selected style scheme.
        
        The property can be set to change the current selection programmatically.
  */
  @property gid.gtksource5.style_scheme.StyleScheme styleScheme() nothrow;

  /**
      Set `styleScheme` property.
      Params:
        propval = Contains the currently selected style scheme.
          
          The property can be set to change the current selection programmatically.
  */
  @property void styleScheme(gid.gtksource5.style_scheme.StyleScheme propval) nothrow;



  /**
      Gets the currently-selected scheme.
      Returns: the currently-selected scheme.
  */
  gid.gtksource5.style_scheme.StyleScheme getStyleScheme();

  /**
      Sets the scheme.
  
      Params:
        scheme = a #GtkSourceStyleScheme
  */
  void setStyleScheme(gid.gtksource5.style_scheme.StyleScheme scheme);
}

/// Fluent builder implementation template for [gid.gtksource5.style_scheme_chooser.StyleSchemeChooser]
interface StyleSchemeChooserGidBuilderImpl(T)
{

  /**
      Set `styleScheme` property.
      Params:
        propval = Contains the currently selected style scheme.
          
          The property can be set to change the current selection programmatically.
      Returns: Builder instance for fluent chaining
  */
  T styleScheme(gid.gtksource5.style_scheme.StyleScheme propval) nothrow;
}
