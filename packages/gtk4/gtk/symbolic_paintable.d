/// Module for [SymbolicPaintable] interface
module gtk.symbolic_paintable;

public import gtk.symbolic_paintable_iface_proxy;
import gdk.rgba;
import gdk.snapshot;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    [gtk.symbolic_paintable.SymbolicPaintable] is an interface that support symbolic colors in
    paintables.
    
    [gdk.paintable.Paintable]s implementing the interface will have the
    `vfunc@Gtk.SymbolicPaintable.snapshot_symbolic` function called and
    have the colors for drawing symbolic icons passed. At least 4 colors are guaranteed
    to be passed every time.
    
    These 4 colors are the foreground color, and the colors to use for errors, warnings
    and success information in that order.
    
    More colors may be added in the future.
*/
interface SymbolicPaintable
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_symbolic_paintable_get_type != &gidSymbolNotFound ? gtk_symbolic_paintable_get_type() : cast(GType)0;
  }

  /**
      Snapshots the paintable with the given colors.
      
      If less than 4 colors are provided, GTK will pad the array with default
      colors.
  
      Params:
        snapshot = a [gdk.snapshot.Snapshot] to snapshot to
        width = width to snapshot in
        height = height to snapshot in
        colors = a pointer to an array of colors
  */
  void snapshotSymbolic(gdk.snapshot.Snapshot snapshot, double width, double height, gdk.rgba.RGBA[] colors);
}

/// Fluent builder implementation template for [gtk.symbolic_paintable.SymbolicPaintable]
interface SymbolicPaintableGidBuilderImpl(T)
{
}
