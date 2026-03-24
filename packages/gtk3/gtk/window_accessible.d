/// Module for [WindowAccessible] class
module gtk.window_accessible;

import atk.component;
import atk.component_mixin;
import atk.window;
import atk.window_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class WindowAccessible : gtk.container_accessible.ContainerAccessible, atk.window.Window
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_window_accessible_get_type != &gidSymbolNotFound ? gtk_window_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WindowAccessible self()
  {
    return this;
  }

  /**
  Get builder for [gtk.window_accessible.WindowAccessible]
  Returns: New builder object
  */
  static WindowAccessibleGidBuilder builder()
  {
    return new WindowAccessibleGidBuilder;
  }

  mixin WindowT!();
}

class WindowAccessibleGidBuilderImpl(T) : gtk.container_accessible.ContainerAccessibleGidBuilderImpl!T, atk.window.WindowGidBuilderImpl!T
{

  mixin WindowGidBuilderT!();
}

/// Fluent builder for [gtk.window_accessible.WindowAccessible]
final class WindowAccessibleGidBuilder : WindowAccessibleGidBuilderImpl!WindowAccessibleGidBuilder
{
  WindowAccessible build()
  {
    return new WindowAccessible(cast(void*)createGObject(WindowAccessible._getGType), No.Take);
  }
}
