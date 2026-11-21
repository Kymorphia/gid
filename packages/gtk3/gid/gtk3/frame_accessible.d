/// Module for [FrameAccessible] class
module gid.gtk3.frame_accessible;

public import gid.core.basictypes;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container_accessible;
import gid.gtk3.types;

/** */
class FrameAccessible : gid.gtk3.container_accessible.ContainerAccessible
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
    return cast(void function())gtk_frame_accessible_get_type != &gidSymbolNotFound ? gtk_frame_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkFrameAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override FrameAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.frame_accessible.FrameAccessible]
      Returns: New builder object
  */
  static FrameAccessibleGidBuilder builder() nothrow
  {
    return new FrameAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gtk3.frame_accessible.FrameAccessible]
class FrameAccessibleGidBuilderImpl(T) : gid.gtk3.container_accessible.ContainerAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.frame_accessible.FrameAccessible]
final class FrameAccessibleGidBuilder : FrameAccessibleGidBuilderImpl!FrameAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FrameAccessible build() nothrow
  {
    return new FrameAccessible(cast(void*)createGObject(FrameAccessible._getGType), Yes.Take);
  }
}
