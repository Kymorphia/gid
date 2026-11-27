/// Module for [HoverProvider] interface
module gid.gtksource5.hover_provider;

public import gid.core.basictypes;
public import gid.gtksource5.hover_provider_iface_proxy;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.hover_context;
import gid.gtksource5.hover_display;
import gid.gtksource5.types;

/**
    Interface to populate interactive tooltips.
    
    [gid.gtksource5.hover_provider.HoverProvider] is an interface that should be implemented to extend
    the contents of a [gid.gtksource5.hover_display.HoverDisplay]. This is typical in editors that
    interact external tooling such as those utilizing Language Server Protocol.
    
    If you can populate the [gid.gtksource5.hover_display.HoverDisplay] synchronously, use
    `vfunc@HoverProvider.populate`. Otherwise, interface implementations that
    may take additional time should use `vfunc@HoverProvider.populate_async`
    to avoid blocking the main loop.
*/
@gidGir("HoverProvider", "HoverProviderInterface")
interface HoverProvider : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_hover_provider_get_type != &gidSymbolNotFound ? gtk_source_hover_provider_get_type() : cast(GType)0;
  }




  /** */
  void populateAsync(gid.gtksource5.hover_context.HoverContext context, gid.gtksource5.hover_display.HoverDisplay display, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null);

  /** */
  bool populateFinish(gid.gio2.async_result.AsyncResult result);
}

/// Fluent builder implementation template for [gid.gtksource5.hover_provider.HoverProvider]
interface HoverProviderGidBuilderImpl(T)
{
}
