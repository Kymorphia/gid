/// Module for [StyleSchemeChooser] interface mixin
module gid.gtksource5.style_scheme_chooser_mixin;

public import gid.core.basictypes;
public import gid.gtksource5.style_scheme_chooser_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtksource5.c.functions;
public import gid.gtksource5.c.types;
public import gid.gtksource5.style_scheme;
public import gid.gtksource5.types;

/**
    Interface implemented by widgets for choosing style schemes.
    
    [gid.gtksource5.style_scheme_chooser.StyleSchemeChooser] is an interface that is implemented by widgets
    for choosing style schemes.
    
    In GtkSourceView, the main widgets that implement this interface are
    [gid.gtksource5.style_scheme_chooser_widget.StyleSchemeChooserWidget] and [gid.gtksource5.style_scheme_chooser_button.StyleSchemeChooserButton].
*/
template StyleSchemeChooserT()
{

  /**
      Get `styleScheme` property.
      Returns: Contains the currently selected style scheme.
        
        The property can be set to change the current selection programmatically.
  */
  @property gid.gtksource5.style_scheme.StyleScheme styleScheme() nothrow
  {
    return getStyleScheme();
  }

  /**
      Set `styleScheme` property.
      Params:
        propval = Contains the currently selected style scheme.
          
          The property can be set to change the current selection programmatically.
  */
  @property void styleScheme(gid.gtksource5.style_scheme.StyleScheme propval) nothrow
  {
    setStyleScheme(propval);
  }

  /**
      Gets the currently-selected scheme.
      Returns: the currently-selected scheme.
  */
  override gid.gtksource5.style_scheme.StyleScheme getStyleScheme() nothrow
  {
    GtkSourceStyleScheme* _cretval;
    _cretval = gtk_source_style_scheme_chooser_get_style_scheme(cast(GtkSourceStyleSchemeChooser*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.style_scheme.StyleScheme)(cast(GtkSourceStyleScheme*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the scheme.
  
      Params:
        scheme = a #GtkSourceStyleScheme
  */
  override void setStyleScheme(gid.gtksource5.style_scheme.StyleScheme scheme) nothrow
  {
    gtk_source_style_scheme_chooser_set_style_scheme(cast(GtkSourceStyleSchemeChooser*)this._cPtr, scheme ? cast(GtkSourceStyleScheme*)scheme._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtksource5.style_scheme_chooser.StyleSchemeChooser]
template StyleSchemeChooserGidBuilderT()
{

  /**
      Set `styleScheme` property.
      Params:
        propval = Contains the currently selected style scheme.
          
          The property can be set to change the current selection programmatically.
      Returns: Builder instance for fluent chaining
  */
  T styleScheme(gid.gtksource5.style_scheme.StyleScheme propval) nothrow
  {
    return setProperty("style-scheme", propval);
  }
}
