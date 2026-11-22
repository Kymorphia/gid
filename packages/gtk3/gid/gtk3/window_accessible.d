/// Module for [WindowAccessible] class
module gid.gtk3.window_accessible;

public import gid.core.basictypes;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.window;
import gid.atk1.window_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container_accessible;
import gid.gtk3.types;

/** */
class WindowAccessible : gid.gtk3.container_accessible.ContainerAccessible, gid.atk1.window.Window
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_window_accessible_get_type != &gidSymbolNotFound ? gtk_window_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkWindowAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override WindowAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.window_accessible.WindowAccessible]
      Returns: New builder object
  */
  static WindowAccessibleGidBuilder builder() nothrow
  {
    return new WindowAccessibleGidBuilder;
  }

  mixin WindowT!();
}

/// Fluent builder implementation template for [gid.gtk3.window_accessible.WindowAccessible]
class WindowAccessibleGidBuilderImpl(T) : gid.gtk3.container_accessible.ContainerAccessibleGidBuilderImpl!T, gid.atk1.window.WindowGidBuilderImpl!T
{

  mixin WindowGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.window_accessible.WindowAccessible]
final class WindowAccessibleGidBuilder : WindowAccessibleGidBuilderImpl!WindowAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WindowAccessible build() nothrow
  {
    return new WindowAccessible(cast(void*)createGObject(WindowAccessible._getGType), Yes.Take);
  }
}
