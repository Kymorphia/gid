/// Module for [ScrolledWindowAccessible] class
module gid.gtk3.scrolled_window_accessible;

public import gid.core.basictypes;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container_accessible;
import gid.gtk3.types;

/** */
class ScrolledWindowAccessible : gid.gtk3.container_accessible.ContainerAccessible
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_scrolled_window_accessible_get_type != &gidSymbolNotFound ? gtk_scrolled_window_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkScrolledWindowAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override ScrolledWindowAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.scrolled_window_accessible.ScrolledWindowAccessible]
      Returns: New builder object
  */
  static ScrolledWindowAccessibleGidBuilder builder() nothrow
  {
    return new ScrolledWindowAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gtk3.scrolled_window_accessible.ScrolledWindowAccessible]
class ScrolledWindowAccessibleGidBuilderImpl(T) : gid.gtk3.container_accessible.ContainerAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.scrolled_window_accessible.ScrolledWindowAccessible]
final class ScrolledWindowAccessibleGidBuilder : ScrolledWindowAccessibleGidBuilderImpl!ScrolledWindowAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ScrolledWindowAccessible build() nothrow
  {
    return new ScrolledWindowAccessible(cast(void*)createGObject(ScrolledWindowAccessible._getGType), Yes.Take);
  }
}
