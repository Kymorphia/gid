/// Module for [Snapshot] class
module gdk.snapshot;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/**
    Base type for snapshot operations.
    
    The subclass of [gdk.snapshot.Snapshot] used by GTK is [GtkSnapshot](../gtk4/class.Snapshot.html).
*/
class Snapshot : gobject.object.ObjectWrap
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
    return cast(void function())gdk_snapshot_get_type != &gidSymbolNotFound ? gdk_snapshot_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Snapshot self()
  {
    return this;
  }

  /**
      Get builder for [gdk.snapshot.Snapshot]
      Returns: New builder object
  */
  static SnapshotGidBuilder builder()
  {
    return new SnapshotGidBuilder;
  }
}

/// Fluent builder implementation template for [gdk.snapshot.Snapshot]
class SnapshotGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gdk.snapshot.Snapshot]
final class SnapshotGidBuilder : SnapshotGidBuilderImpl!SnapshotGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Snapshot build()
  {
    return new Snapshot(cast(void*)createGObject(Snapshot._getGType), No.Take);
  }
}
