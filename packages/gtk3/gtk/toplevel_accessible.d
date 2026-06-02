/// Module for [ToplevelAccessible] class
module gtk.toplevel_accessible;

public import gid.basictypes;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_toplevel_accessible_get_type != &gidSymbolNotFound ? gtk_toplevel_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ToplevelAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.toplevel_accessible.ToplevelAccessible]
      Returns: New builder object
  */
  static ToplevelAccessibleGidBuilder builder() nothrow
  {
    return new ToplevelAccessibleGidBuilder;
  }

  /** */
  gtk.window.Window[] getChildren() nothrow
  {
    GList* _cretval;
    _cretval = gtk_toplevel_accessible_get_children(cast(GtkToplevelAccessible*)this._cPtr);
    auto _retval = gListToD!(gtk.window.Window, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }
}

/// Fluent builder implementation template for [gtk.toplevel_accessible.ToplevelAccessible]
class ToplevelAccessibleGidBuilderImpl(T) : atk.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gtk.toplevel_accessible.ToplevelAccessible]
final class ToplevelAccessibleGidBuilder : ToplevelAccessibleGidBuilderImpl!ToplevelAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ToplevelAccessible build() nothrow
  {
    return new ToplevelAccessible(cast(void*)createGObject(ToplevelAccessible._getGType), No.Take);
  }
}
