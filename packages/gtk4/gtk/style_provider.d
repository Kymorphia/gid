/// Module for [StyleProvider] interface
module gtk.style_provider;

public import gtk.style_provider_iface_proxy;
import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    [gtk.style_provider.StyleProvider] is an interface for style information used by
    [gtk.style_context.StyleContext].
    
    See [gtk.style_context.StyleContext.addProvider] and
    [gtk.style_context.StyleContext.addProviderForDisplay] for
    adding `GtkStyleProviders`.
    
    GTK uses the [gtk.style_provider.StyleProvider] implementation for CSS in
    [gtk.css_provider.CssProvider].
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
      Connect to `GtkPrivateChanged` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.style_provider.StyleProvider styleProvider))
  
          `styleProvider` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectGtkPrivateChanged(T)(T callback, Flag!"After" after = No.After);
}

interface StyleProviderGidBuilderImpl(T)
{
}
