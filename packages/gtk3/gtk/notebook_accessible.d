/// Module for [NotebookAccessible] class
module gtk.notebook_accessible;

public import gid.basictypes;
import atk.component;
import atk.component_mixin;
import atk.selection;
import atk.selection_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class NotebookAccessible : gtk.container_accessible.ContainerAccessible, atk.selection.Selection
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
    return cast(void function())gtk_notebook_accessible_get_type != &gidSymbolNotFound ? gtk_notebook_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NotebookAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.notebook_accessible.NotebookAccessible]
      Returns: New builder object
  */
  static NotebookAccessibleGidBuilder builder() nothrow
  {
    return new NotebookAccessibleGidBuilder;
  }

  mixin SelectionT!();
}

/// Fluent builder implementation template for [gtk.notebook_accessible.NotebookAccessible]
class NotebookAccessibleGidBuilderImpl(T) : gtk.container_accessible.ContainerAccessibleGidBuilderImpl!T, atk.selection.SelectionGidBuilderImpl!T
{

  mixin SelectionGidBuilderT!();
}

/// Fluent builder for [gtk.notebook_accessible.NotebookAccessible]
final class NotebookAccessibleGidBuilder : NotebookAccessibleGidBuilderImpl!NotebookAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NotebookAccessible build() nothrow
  {
    return new NotebookAccessible(cast(void*)createGObject(NotebookAccessible._getGType), No.Take);
  }
}
