/// Module for [IconViewAccessible] class
module gid.gtk3.icon_view_accessible;

public import gid.core.basictypes;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.selection;
import gid.atk1.selection_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container_accessible;
import gid.gtk3.types;

/** */
class IconViewAccessible : gid.gtk3.container_accessible.ContainerAccessible, gid.atk1.selection.Selection
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
    return cast(void function())gtk_icon_view_accessible_get_type != &gidSymbolNotFound ? gtk_icon_view_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkIconViewAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override IconViewAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.icon_view_accessible.IconViewAccessible]
      Returns: New builder object
  */
  static IconViewAccessibleGidBuilder builder() nothrow
  {
    return new IconViewAccessibleGidBuilder;
  }

  mixin SelectionT!();
}

/// Fluent builder implementation template for [gid.gtk3.icon_view_accessible.IconViewAccessible]
class IconViewAccessibleGidBuilderImpl(T) : gid.gtk3.container_accessible.ContainerAccessibleGidBuilderImpl!T, gid.atk1.selection.SelectionGidBuilderImpl!T
{

  mixin SelectionGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.icon_view_accessible.IconViewAccessible]
final class IconViewAccessibleGidBuilder : IconViewAccessibleGidBuilderImpl!IconViewAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  IconViewAccessible build() nothrow
  {
    return new IconViewAccessible(cast(void*)createGObject(IconViewAccessible._getGType), Yes.Take);
  }
}
