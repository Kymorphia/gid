/// Module for [PlugAccessible] class
module gtk.plug_accessible;

public import gid.basictypes;
import atk.component;
import atk.component_mixin;
import atk.window;
import atk.window_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.window_accessible;

/** */
class PlugAccessible : gtk.window_accessible.WindowAccessible
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
    return cast(void function())gtk_plug_accessible_get_type != &gidSymbolNotFound ? gtk_plug_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PlugAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.plug_accessible.PlugAccessible]
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

/// Fluent builder implementation template for [gtk.plug_accessible.PlugAccessible]
class PlugAccessibleGidBuilderImpl(T) : gtk.window_accessible.WindowAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.plug_accessible.PlugAccessible]
final class PlugAccessibleGidBuilder : PlugAccessibleGidBuilderImpl!PlugAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PlugAccessible build() nothrow
  {
    return new PlugAccessible(cast(void*)createGObject(PlugAccessible._getGType), No.Take);
  }
}
