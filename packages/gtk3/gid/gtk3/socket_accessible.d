/// Module for [SocketAccessible] class
module gid.gtk3.socket_accessible;

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
@gidGir("SocketAccessible", "SocketAccessibleClass")
class SocketAccessible : gid.gtk3.container_accessible.ContainerAccessible
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
    return cast(void function())gtk_socket_accessible_get_type != &gidSymbolNotFound ? gtk_socket_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSocketAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override SocketAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.socket_accessible.SocketAccessible]
      Returns: New builder object
  */
  static SocketAccessibleGidBuilder builder() nothrow
  {
    return new SocketAccessibleGidBuilder;
  }

  /** */
  void embed(string path) nothrow
  {
    char* _path = path.toCString!(No.Malloc, No.Nullable);
    gtk_socket_accessible_embed(cast(GtkSocketAccessible*)this._cPtr, _path);
  }
}

/// Fluent builder implementation template for [gid.gtk3.socket_accessible.SocketAccessible]
class SocketAccessibleGidBuilderImpl(T) : gid.gtk3.container_accessible.ContainerAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.socket_accessible.SocketAccessible]
final class SocketAccessibleGidBuilder : SocketAccessibleGidBuilderImpl!SocketAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SocketAccessible build() nothrow
  {
    return new SocketAccessible(cast(void*)createGObject(SocketAccessible._getGType), Yes.Take);
  }
}
