/// Module for [StyleProvider] interface
module gid.gtk3.style_provider;

public import gid.core.basictypes;
public import gid.gtk3.style_provider_iface_proxy;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.param_spec;
import gid.gobject2.value;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.icon_factory;
import gid.gtk3.style_properties;
import gid.gtk3.types;
import gid.gtk3.widget_path;

/**
    GtkStyleProvider is an interface used to provide style information to a #GtkStyleContext.
    See [gid.gtk4.style_context.StyleContext.addProvider] and [gid.gtk3.style_context.StyleContext.addProviderForScreen].
*/
@gidGir("StyleProvider", "StyleProviderIface")
interface StyleProvider : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_style_provider_get_type != &gidSymbolNotFound ? gtk_style_provider_get_type() : cast(GType)0;
  }




  /**
      Returns the #GtkIconFactory defined to be in use for path, or null if none
      is defined.
  
      Params:
        path = #GtkWidgetPath to query
      Returns: The icon factory to use for path, or null
  
      Deprecated: Will always return null for all GTK-provided style providers.
  */
  gid.gtk3.icon_factory.IconFactory getIconFactory(gid.gtk3.widget_path.WidgetPath path);

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
  gid.gtk3.style_properties.StyleProperties getStyle(gid.gtk3.widget_path.WidgetPath path);

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
  bool getStyleProperty(gid.gtk3.widget_path.WidgetPath path, gid.gtk3.types.StateFlags state, gid.gobject2.param_spec.ParamSpec pspec, out gid.gobject2.value.Value value);
}

/// Fluent builder implementation template for [gid.gtk3.style_provider.StyleProvider]
interface StyleProviderGidBuilderImpl(T)
{
}
