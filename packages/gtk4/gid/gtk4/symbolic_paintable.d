/// Module for [SymbolicPaintable] interface
module gid.gtk4.symbolic_paintable;

public import gid.core.basictypes;
public import gid.gtk4.symbolic_paintable_iface_proxy;
import gid.core.utils;
import gid.gdk4.paintable;
import gid.gdk4.rgba;
import gid.gdk4.snapshot;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    An interface that supports symbolic colors in paintables.
    
    [gid.gdk4.paintable.Paintable]s implementing the interface will have the
    `vfunc@Gtk.SymbolicPaintable.snapshot_symbolic` function called and
    have the colors for drawing symbolic icons passed. At least 5 colors
    are guaranteed to be passed every time. These 5 colors are the
    foreground color, and the colors to use for errors, warnings
    and success information in that order, followed by the system
    accent color.
    
    The system accent color has been added in GTK 4.22.
    More colors may be added in the future.
*/
interface SymbolicPaintable : gid.gdk4.paintable.Paintable
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_symbolic_paintable_get_type != &gidSymbolNotFound ? gtk_symbolic_paintable_get_type() : cast(GType)0;
  }

  /**
      Snapshots the paintable with the given colors.
      
      If less than 5 colors are provided, GTK will pad the array with default
      colors.
  
      Params:
        snapshot = a [gid.gdk4.snapshot.Snapshot] to snapshot to
        width = width to snapshot in
        height = height to snapshot in
        colors = a pointer to an array of colors
  */
  void snapshotSymbolic(gid.gdk4.snapshot.Snapshot snapshot, double width, double height, gid.gdk4.rgba.RGBA[] colors);

  /**
      Snapshots the paintable with the given colors and weight.
      
      If less than 5 colors are provided, GTK will pad the array with default
      colors.
  
      Params:
        snapshot = a [gid.gdk4.snapshot.Snapshot] to snapshot to
        width = width to snapshot in
        height = height to snapshot in
        colors = a pointer to an array of colors
        weight = The font weight to use (from 1 to 1000, with default 400)
  */
  void snapshotWithWeight(gid.gdk4.snapshot.Snapshot snapshot, double width, double height, gid.gdk4.rgba.RGBA[] colors, double weight);
}

/// Fluent builder implementation template for [gid.gtk4.symbolic_paintable.SymbolicPaintable]
interface SymbolicPaintableGidBuilderImpl(T) : gid.gdk4.paintable.PaintableGidBuilderImpl!T
{
}
