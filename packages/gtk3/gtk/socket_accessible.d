/// Module for [SocketAccessible] class
module gtk.socket_accessible;

import atk.component;
import atk.component_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class SocketAccessible : gtk.container_accessible.ContainerAccessible
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
    return cast(void function())gtk_socket_accessible_get_type != &gidSymbolNotFound ? gtk_socket_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SocketAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.socket_accessible.SocketAccessible]
      Returns: New builder object
  */
  static SocketAccessibleGidBuilder builder()
  {
    return new SocketAccessibleGidBuilder;
  }

  /** */
  void embed(string path)
  {
    char* _path = path.toCString(No.Alloc);
    gtk_socket_accessible_embed(cast(GtkSocketAccessible*)this._cPtr, _path);
  }
}

/// Fluent builder implementation template for [gtk.socket_accessible.SocketAccessible]
class SocketAccessibleGidBuilderImpl(T) : gtk.container_accessible.ContainerAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.socket_accessible.SocketAccessible]
final class SocketAccessibleGidBuilder : SocketAccessibleGidBuilderImpl!SocketAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SocketAccessible build()
  {
    return new SocketAccessible(cast(void*)createGObject(SocketAccessible._getGType), No.Take);
  }
}
