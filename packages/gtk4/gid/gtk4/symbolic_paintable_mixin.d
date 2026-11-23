/// Module for [SymbolicPaintable] interface mixin
module gid.gtk4.symbolic_paintable_mixin;

public import gid.core.basictypes;
public import gid.gtk4.symbolic_paintable_iface_proxy;
public import gid.core.utils;
public import gid.gdk4.rgba;
public import gid.gdk4.snapshot;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSnapshotSymbolic`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSnapshotSymbolic(gid.gdk4.snapshot.Snapshot snapshot, double width, double height, gid.gdk4.rgba.RGBA[] colors)
  {
    auto _klass = cast(GtkSymbolicPaintableInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.symbolic_paintable.SymbolicPaintable._getGType);
    if (!_klass || !_klass.snapshotSymbolic)
      return;

    size_t _nColors;
    if (colors)
      _nColors = cast(size_t)colors.length;

    auto _colors = cast(GdkRGBA*)colors.ptr;
    _klass.snapshotSymbolic(cast(GtkSymbolicPaintable*)this._cPtr, snapshot ? cast(GdkSnapshot*)snapshot._cPtr(No.Dup) : null, width, height, _colors, _nColors);
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSnapshotWithWeight`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSnapshotWithWeight(gid.gdk4.snapshot.Snapshot snapshot, double width, double height, gid.gdk4.rgba.RGBA[] colors, double weight)
  {
    auto _klass = cast(GtkSymbolicPaintableInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.symbolic_paintable.SymbolicPaintable._getGType);
    if (!_klass || !_klass.snapshotWithWeight)
      return;

    size_t _nColors;
    if (colors)
      _nColors = cast(size_t)colors.length;

    auto _colors = cast(GdkRGBA*)colors.ptr;
    _klass.snapshotWithWeight(cast(GtkSymbolicPaintable*)this._cPtr, snapshot ? cast(GdkSnapshot*)snapshot._cPtr(No.Dup) : null, width, height, _colors, _nColors, weight);
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

  /// True if the D class T overrides any vfunc method of gid.gtk4.symbolic_paintable.SymbolicPaintable (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk4_symbolic_paintable_SymbolicPaintable(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSnapshotSymbolic", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSnapshotWithWeight", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk4.symbolic_paintable.SymbolicPaintable vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk4_symbolic_paintable_SymbolicPaintable(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSnapshotSymbolic", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_symbolic_paintable_SymbolicPaintable(iface, "snapshot_symbolic");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSnapshotWithWeight", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_symbolic_paintable_SymbolicPaintable(iface, "snapshot_with_weight");
  }

  private static void _installIfaceVfunc_gid_gtk4_symbolic_paintable_SymbolicPaintable(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkSymbolicPaintableInterface*)iface;

    switch (vfunc)
    {
      case "snapshot_symbolic":
      {
        static extern(C) void _vfuncSnapshotSymbolicTramp(GtkSymbolicPaintable* paintable, GdkSnapshot* snapshot, double width, double height, const(GdkRGBA)* colors, size_t nColors) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)paintable);
          if (!_obj)
          {
            auto _klass = cast(GtkSymbolicPaintableInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)paintable), gid.gtk4.symbolic_paintable.SymbolicPaintable._getGType);
            if (_klass && _klass.snapshotSymbolic)
              return (cast(typeof(&_vfuncSnapshotSymbolicTramp))_klass.snapshotSymbolic)(paintable, snapshot, width, height, colors, nColors);
            return;
          }

          gid.gdk4.rgba.RGBA[] _colors;
          _colors.length = nColors;
          _colors[0 .. nColors] = (cast(gid.gdk4.rgba.RGBA*)colors)[0 .. nColors];

          try
          {
            _obj.vfuncSnapshotSymbolic(gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.snapshot.Snapshot)(cast(void*)snapshot, No.Take), width, height, _colors);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.symbolic_paintable.SymbolicPaintable.vfuncSnapshotSymbolic");
          }
        }

        _klass.snapshotSymbolic = cast(typeof(_klass.snapshotSymbolic))&_vfuncSnapshotSymbolicTramp;
        break;
      }
      case "snapshot_with_weight":
      {
        static extern(C) void _vfuncSnapshotWithWeightTramp(GtkSymbolicPaintable* paintable, GdkSnapshot* snapshot, double width, double height, const(GdkRGBA)* colors, size_t nColors, double weight) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)paintable);
          if (!_obj)
          {
            auto _klass = cast(GtkSymbolicPaintableInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)paintable), gid.gtk4.symbolic_paintable.SymbolicPaintable._getGType);
            if (_klass && _klass.snapshotWithWeight)
              return (cast(typeof(&_vfuncSnapshotWithWeightTramp))_klass.snapshotWithWeight)(paintable, snapshot, width, height, colors, nColors, weight);
            return;
          }

          gid.gdk4.rgba.RGBA[] _colors;
          _colors.length = nColors;
          _colors[0 .. nColors] = (cast(gid.gdk4.rgba.RGBA*)colors)[0 .. nColors];

          try
          {
            _obj.vfuncSnapshotWithWeight(gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.snapshot.Snapshot)(cast(void*)snapshot, No.Take), width, height, _colors, weight);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.symbolic_paintable.SymbolicPaintable.vfuncSnapshotWithWeight");
          }
        }

        _klass.snapshotWithWeight = cast(typeof(_klass.snapshotWithWeight))&_vfuncSnapshotWithWeightTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.symbolic_paintable.SymbolicPaintable]
template SymbolicPaintableGidBuilderT()
{
}
