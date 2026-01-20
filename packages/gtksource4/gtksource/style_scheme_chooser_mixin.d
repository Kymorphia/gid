/// Module for [StyleSchemeChooser] interface mixin
module gtksource.style_scheme_chooser_mixin;

public import gtksource.style_scheme_chooser_iface_proxy;
public import gid.gid;
public import gobject.object;
public import gtksource.c.functions;
public import gtksource.c.types;
public import gtksource.style_scheme;
public import gtksource.types;

/** */
template StyleSchemeChooserT()
{

  /**
      Get `styleScheme` property.
      Returns: The :style-scheme property contains the currently selected style
        scheme. The property can be set to change
        the current selection programmatically.
  */
  @property gtksource.style_scheme.StyleScheme styleScheme()
  {
    return getStyleScheme();
  }

  /**
      Set `styleScheme` property.
      Params:
        propval = The :style-scheme property contains the currently selected style
          scheme. The property can be set to change
          the current selection programmatically.
  */
  @property void styleScheme(gtksource.style_scheme.StyleScheme propval)
  {
    return setStyleScheme(propval);
  }

  /**
      Gets the currently-selected scheme.
      Returns: the currently-selected scheme.
  */
  override gtksource.style_scheme.StyleScheme getStyleScheme()
  {
    GtkSourceStyleScheme* _cretval;
    _cretval = gtk_source_style_scheme_chooser_get_style_scheme(cast(GtkSourceStyleSchemeChooser*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.style_scheme.StyleScheme)(cast(GtkSourceStyleScheme*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the scheme.
  
      Params:
        scheme = a #GtkSourceStyleScheme
  */
  override void setStyleScheme(gtksource.style_scheme.StyleScheme scheme)
  {
    gtk_source_style_scheme_chooser_set_style_scheme(cast(GtkSourceStyleSchemeChooser*)this._cPtr, scheme ? cast(GtkSourceStyleScheme*)scheme._cPtr(No.Dup) : null);
  }
}
