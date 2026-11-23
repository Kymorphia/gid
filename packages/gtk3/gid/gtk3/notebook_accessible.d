/// Module for [NotebookAccessible] class
module gid.gtk3.notebook_accessible;

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
class NotebookAccessible : gid.gtk3.container_accessible.ContainerAccessible, gid.atk1.selection.Selection
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
    return cast(void function())gtk_notebook_accessible_get_type != &gidSymbolNotFound ? gtk_notebook_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkNotebookAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override NotebookAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.notebook_accessible.NotebookAccessible]
      Returns: New builder object
  */
  static NotebookAccessibleGidBuilder builder() nothrow
  {
    return new NotebookAccessibleGidBuilder;
  }

  mixin SelectionT!();
}

/// Fluent builder implementation template for [gid.gtk3.notebook_accessible.NotebookAccessible]
class NotebookAccessibleGidBuilderImpl(T) : gid.gtk3.container_accessible.ContainerAccessibleGidBuilderImpl!T, gid.atk1.selection.SelectionGidBuilderImpl!T
{

  mixin SelectionGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.notebook_accessible.NotebookAccessible]
final class NotebookAccessibleGidBuilder : NotebookAccessibleGidBuilderImpl!NotebookAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NotebookAccessible build() nothrow
  {
    return new NotebookAccessible(cast(void*)createGObject(NotebookAccessible._getGType), Yes.Take);
  }
}
