/// Module for [ScrolledWindowAccessible] class
module gtk.scrolled_window_accessible;

public import gid.basictypes;
import atk.component;
import atk.component_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class ScrolledWindowAccessible : gtk.container_accessible.ContainerAccessible
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_scrolled_window_accessible_get_type != &gidSymbolNotFound ? gtk_scrolled_window_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ScrolledWindowAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.scrolled_window_accessible.ScrolledWindowAccessible]
      Returns: New builder object
  */
  static ScrolledWindowAccessibleGidBuilder builder() nothrow
  {
    return new ScrolledWindowAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gtk.scrolled_window_accessible.ScrolledWindowAccessible]
class ScrolledWindowAccessibleGidBuilderImpl(T) : gtk.container_accessible.ContainerAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.scrolled_window_accessible.ScrolledWindowAccessible]
final class ScrolledWindowAccessibleGidBuilder : ScrolledWindowAccessibleGidBuilderImpl!ScrolledWindowAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ScrolledWindowAccessible build() nothrow
  {
    return new ScrolledWindowAccessible(cast(void*)createGObject(ScrolledWindowAccessible._getGType), No.Take);
  }
}
