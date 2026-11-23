/// Module for [ToplevelAccessible] class
module gid.gtk3.toplevel_accessible;

public import gid.core.basictypes;
import gid.atk1.object;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.window;

/** */
class ToplevelAccessible : gid.atk1.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_toplevel_accessible_get_type != &gidSymbolNotFound ? gtk_toplevel_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkToplevelAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override ToplevelAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.toplevel_accessible.ToplevelAccessible]
      Returns: New builder object
  */
  static ToplevelAccessibleGidBuilder builder() nothrow
  {
    return new ToplevelAccessibleGidBuilder;
  }

  /** */
  gid.gtk3.window.Window[] getChildren() nothrow
  {
    GList* _cretval;
    _cretval = gtk_toplevel_accessible_get_children(cast(GtkToplevelAccessible*)this._cPtr);
    auto _retval = gListToD!(gid.gtk3.window.Window, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk3.toplevel_accessible.ToplevelAccessible]
class ToplevelAccessibleGidBuilderImpl(T) : gid.atk1.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk3.toplevel_accessible.ToplevelAccessible]
final class ToplevelAccessibleGidBuilder : ToplevelAccessibleGidBuilderImpl!ToplevelAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ToplevelAccessible build() nothrow
  {
    return new ToplevelAccessible(cast(void*)createGObject(ToplevelAccessible._getGType), Yes.Take);
  }
}
