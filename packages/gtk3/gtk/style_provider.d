/// Module for [StyleProvider] interface
module gtk.style_provider;

public import gtk.style_provider_iface_proxy;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gobject.param_spec;
import gobject.value;
import gtk.c.functions;
import gtk.c.types;
import gtk.icon_factory;
import gtk.style_properties;
import gtk.types;
import gtk.widget_path;

/**
    GtkStyleProvider is an interface used to provide style information to a #GtkStyleContext.
    See [gtk.style_context.StyleContext.addProvider] and [gtk.style_context.StyleContext.addProviderForScreen].
*/
interface StyleProvider
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
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
  gtk.icon_factory.IconFactory getIconFactory(gtk.widget_path.WidgetPath path);

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
  gtk.style_properties.StyleProperties getStyle(gtk.widget_path.WidgetPath path);

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
  bool getStyleProperty(gtk.widget_path.WidgetPath path, gtk.types.StateFlags state, gobject.param_spec.ParamSpec pspec, out gobject.value.Value value);
}

/// Fluent builder implementation template for [gtk.style_provider.StyleProvider]
interface StyleProviderGidBuilderImpl(T)
{
}
