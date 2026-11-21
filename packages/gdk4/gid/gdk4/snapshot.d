/// Module for [Snapshot] class
module gid.gdk4.snapshot;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Base type for snapshot operations.
    
    The subclass of [gid.gdk4.snapshot.Snapshot] used by GTK is [GtkSnapshot](../gtk4/class.Snapshot.html).
*/
class Snapshot : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gdk_snapshot_get_type != &gidSymbolNotFound ? gdk_snapshot_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkSnapshot";
  }

  /** Returns `this`, for use in `with` statements. */
  override Snapshot self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gdk4.snapshot.Snapshot]
      Returns: New builder object
  */
  static SnapshotGidBuilder builder() nothrow
  {
    return new SnapshotGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gdk4.snapshot.Snapshot]
class SnapshotGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gdk4.snapshot.Snapshot]
final class SnapshotGidBuilder : SnapshotGidBuilderImpl!SnapshotGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Snapshot build() nothrow
  {
    return new Snapshot(cast(void*)createGObject(Snapshot._getGType), Yes.Take);
  }
}
