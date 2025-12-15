/// Module for [StyleProvider] interface mixin
module gtk.style_provider_mixin;

public import gtk.style_provider_iface_proxy;
public import gid.gid;
public import gobject.object;
public import gobject.param_spec;
public import gobject.value;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.icon_factory;
public import gtk.style_properties;
public import gtk.types;
public import gtk.widget_path;

/**
    GtkStyleProvider is an interface used to provide style information to a #GtkStyleContext.
    See [gtk.style_context.StyleContext.addProvider] and [gtk.style_context.StyleContext.addProviderForScreen].
*/
template StyleProviderT()
{

  /**
      Returns the #GtkIconFactory defined to be in use for path, or null if none
      is defined.
  
      Params:
        path = #GtkWidgetPath to query
      Returns: The icon factory to use for path, or null
  
      Deprecated: Will always return null for all GTK-provided style providers.
  */
  override gtk.icon_factory.IconFactory getIconFactory(gtk.widget_path.WidgetPath path)
  {
    GtkIconFactory* _cretval;
    _cretval = gtk_style_provider_get_icon_factory(cast(GtkStyleProvider*)this._cPtr, path ? cast(GtkWidgetPath*)path._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.icon_factory.IconFactory)(cast(GtkIconFactory*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the style settings affecting a widget defined by path, or null if
      provider doesn’t contemplate styling path.
  
      Params:
        path = #GtkWidgetPath to query
      Returns: a #GtkStyleProperties containing the
        style settings affecting path
  
      Deprecated: Will always return null for all GTK-provided style providers
            as the interface cannot correctly work the way CSS is specified.
  */
  override gtk.style_properties.StyleProperties getStyle(gtk.widget_path.WidgetPath path)
  {
    GtkStyleProperties* _cretval;
    _cretval = gtk_style_provider_get_style(cast(GtkStyleProvider*)this._cPtr, path ? cast(GtkWidgetPath*)path._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.style_properties.StyleProperties)(cast(GtkStyleProperties*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Looks up a widget style property as defined by provider for
      the widget represented by path.
  
      Params:
        path = #GtkWidgetPath to query
        state = state to query the style property for
        pspec = The #GParamSpec to query
        value = return location for the property value
      Returns: true if the property was found and has a value, false otherwise
  */
  override bool getStyleProperty(gtk.widget_path.WidgetPath path, gtk.types.StateFlags state, gobject.param_spec.ParamSpec pspec, out gobject.value.Value value)
  {
    bool _retval;
    GValue _value;
    _retval = cast(bool)gtk_style_provider_get_style_property(cast(GtkStyleProvider*)this._cPtr, path ? cast(GtkWidgetPath*)path._cPtr(No.Dup) : null, state, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, &_value);
    value = new gobject.value.Value(cast(void*)&_value, No.Take);
    return _retval;
  }
}
