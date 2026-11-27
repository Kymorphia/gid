/// Module for [PlugAccessible] class
module gid.gtk3.plug_accessible;

public import gid.core.basictypes;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.window;
import gid.atk1.window_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.window_accessible;

/** */
@gidGir("PlugAccessible", "PlugAccessibleClass")
class PlugAccessible : gid.gtk3.window_accessible.WindowAccessible
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
    return cast(void function())gtk_plug_accessible_get_type != &gidSymbolNotFound ? gtk_plug_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkPlugAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override PlugAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.plug_accessible.PlugAccessible]
      Returns: New builder object
  */
  static PlugAccessibleGidBuilder builder() nothrow
  {
    return new PlugAccessibleGidBuilder;
  }

  /** */
  string getId() nothrow
  {
    char* _cretval;
    _cretval = gtk_plug_accessible_get_id(cast(GtkPlugAccessible*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk3.plug_accessible.PlugAccessible]
class PlugAccessibleGidBuilderImpl(T) : gid.gtk3.window_accessible.WindowAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.plug_accessible.PlugAccessible]
final class PlugAccessibleGidBuilder : PlugAccessibleGidBuilderImpl!PlugAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PlugAccessible build() nothrow
  {
    return new PlugAccessible(cast(void*)createGObject(PlugAccessible._getGType), Yes.Take);
  }
}
