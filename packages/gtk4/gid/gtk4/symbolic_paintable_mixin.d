/// Module for [SymbolicPaintable] interface mixin
module gid.gtk4.symbolic_paintable_mixin;

public import gid.core.basictypes;
public import gid.gtk4.symbolic_paintable_iface_proxy;
public import gid.core.gid;
public import gid.gdk4.rgba;
public import gid.gdk4.snapshot;
public import gid.gobject2.gid_builder;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
public import gid.gtk4.types;

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
template SymbolicPaintableT()
{

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
  override void snapshotSymbolic(gid.gdk4.snapshot.Snapshot snapshot, double width, double height, gid.gdk4.rgba.RGBA[] colors) nothrow
  {
    size_t _nColors;
    if (colors)
      _nColors = cast(size_t)colors.length;

    auto _colors = cast(GdkRGBA*)colors.ptr;
    gtk_symbolic_paintable_snapshot_symbolic(cast(GtkSymbolicPaintable*)this._cPtr, snapshot ? cast(GdkSnapshot*)snapshot._cPtr(No.Dup) : null, width, height, _colors, _nColors);
  }

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
  override void snapshotWithWeight(gid.gdk4.snapshot.Snapshot snapshot, double width, double height, gid.gdk4.rgba.RGBA[] colors, double weight) nothrow
  {
    size_t _nColors;
    if (colors)
      _nColors = cast(size_t)colors.length;

    auto _colors = cast(GdkRGBA*)colors.ptr;
    gtk_symbolic_paintable_snapshot_with_weight(cast(GtkSymbolicPaintable*)this._cPtr, snapshot ? cast(GdkSnapshot*)snapshot._cPtr(No.Dup) : null, width, height, _colors, _nColors, weight);
  }
}

/// Fluent builder implementation template for [gid.gtk4.symbolic_paintable.SymbolicPaintable]
template SymbolicPaintableGidBuilderT()
{
}
