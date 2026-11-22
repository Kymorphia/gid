/// Module for [StyleProvider] interface mixin
module gid.gtk3.style_provider_mixin;

public import gid.core.basictypes;
public import gid.gtk3.style_provider_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gobject2.param_spec;
public import gid.gobject2.value;
public import gid.gtk3.c.functions;
public import gid.gtk3.c.types;
public import gid.gtk3.icon_factory;
public import gid.gtk3.style_properties;
public import gid.gtk3.types;
public import gid.gtk3.widget_path;

/**
    GtkStyleProvider is an interface used to provide style information to a #GtkStyleContext.
    See [gid.gtk4.style_context.StyleContext.addProvider] and [gid.gtk3.style_context.StyleContext.addProviderForScreen].
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
  override gid.gtk3.icon_factory.IconFactory getIconFactory(gid.gtk3.widget_path.WidgetPath path) nothrow
  {
    GtkIconFactory* _cretval;
    _cretval = gtk_style_provider_get_icon_factory(cast(GtkStyleProvider*)this._cPtr, path ? cast(GtkWidgetPath*)path._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.icon_factory.IconFactory)(cast(GtkIconFactory*)_cretval, No.Take);
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
  override gid.gtk3.style_properties.StyleProperties getStyle(gid.gtk3.widget_path.WidgetPath path) nothrow
  {
    GtkStyleProperties* _cretval;
    _cretval = gtk_style_provider_get_style(cast(GtkStyleProvider*)this._cPtr, path ? cast(GtkWidgetPath*)path._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.style_properties.StyleProperties)(cast(GtkStyleProperties*)_cretval, Yes.Take);
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
  override bool getStyleProperty(gid.gtk3.widget_path.WidgetPath path, gid.gtk3.types.StateFlags state, gid.gobject2.param_spec.ParamSpec pspec, out gid.gobject2.value.Value value) nothrow
  {
    bool _retval;
    auto _value = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    _retval = cast(bool)gtk_style_provider_get_style_property(cast(GtkStyleProvider*)this._cPtr, path ? cast(GtkWidgetPath*)path._cPtr(No.Dup) : null, state, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, _value);
    value = new gid.gobject2.value.Value(cast(void*)_value, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk3.style_provider.StyleProvider]
template StyleProviderGidBuilderT()
{
}
