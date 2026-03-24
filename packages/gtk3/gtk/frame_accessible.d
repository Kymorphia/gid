/// Module for [FrameAccessible] class
module gtk.frame_accessible;

import atk.component;
import atk.component_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class FrameAccessible : gtk.container_accessible.ContainerAccessible
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
    return cast(void function())gtk_frame_accessible_get_type != &gidSymbolNotFound ? gtk_frame_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FrameAccessible self()
  {
    return this;
  }

  /**
  Get builder for [gtk.frame_accessible.FrameAccessible]
  Returns: New builder object
  */
  static FrameAccessibleGidBuilder builder()
  {
    return new FrameAccessibleGidBuilder;
  }
}

class FrameAccessibleGidBuilderImpl(T) : gtk.container_accessible.ContainerAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.frame_accessible.FrameAccessible]
final class FrameAccessibleGidBuilder : FrameAccessibleGidBuilderImpl!FrameAccessibleGidBuilder
{
  FrameAccessible build()
  {
    return new FrameAccessible(cast(void*)createGObject(FrameAccessible._getGType), No.Take);
  }
}
