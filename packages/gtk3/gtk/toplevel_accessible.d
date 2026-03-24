/// Module for [ToplevelAccessible] class
module gtk.toplevel_accessible;

import atk.object;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.window;

/** */
class ToplevelAccessible : atk.object.ObjectWrap
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
    return cast(void function())gtk_toplevel_accessible_get_type != &gidSymbolNotFound ? gtk_toplevel_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ToplevelAccessible self()
  {
    return this;
  }

  /**
  Get builder for [gtk.toplevel_accessible.ToplevelAccessible]
  Returns: New builder object
  */
  static ToplevelAccessibleGidBuilder builder()
  {
    return new ToplevelAccessibleGidBuilder;
  }

  /** */
  gtk.window.Window[] getChildren()
  {
    GList* _cretval;
    _cretval = gtk_toplevel_accessible_get_children(cast(GtkToplevelAccessible*)this._cPtr);
    auto _retval = gListToD!(gtk.window.Window, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }
}

class ToplevelAccessibleGidBuilderImpl(T) : atk.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gtk.toplevel_accessible.ToplevelAccessible]
final class ToplevelAccessibleGidBuilder : ToplevelAccessibleGidBuilderImpl!ToplevelAccessibleGidBuilder
{
  ToplevelAccessible build()
  {
    return new ToplevelAccessible(cast(void*)createGObject(ToplevelAccessible._getGType), No.Take);
  }
}
