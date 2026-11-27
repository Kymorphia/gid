/// Module for [ConstraintLayoutChild] class
module gid.gtk4.constraint_layout_child;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.layout_child;
import gid.gtk4.types;

/**
    [gid.gtk4.layout_child.LayoutChild] subclass for children in a [gid.gtk4.constraint_layout.ConstraintLayout].
*/
@gidGir("ConstraintLayoutChild", "ConstraintLayoutChildClass")
class ConstraintLayoutChild : gid.gtk4.layout_child.LayoutChild
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
    return cast(void function())gtk_constraint_layout_child_get_type != &gidSymbolNotFound ? gtk_constraint_layout_child_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkConstraintLayoutChild";
  }

  /** Returns `this`, for use in `with` statements. */
  override ConstraintLayoutChild self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.constraint_layout_child.ConstraintLayoutChild]
      Returns: New builder object
  */
  static ConstraintLayoutChildGidBuilder builder() nothrow
  {
    return new ConstraintLayoutChildGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gtk4.constraint_layout_child.ConstraintLayoutChild]
class ConstraintLayoutChildGidBuilderImpl(T) : gid.gtk4.layout_child.LayoutChildGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.constraint_layout_child.ConstraintLayoutChild]
final class ConstraintLayoutChildGidBuilder : ConstraintLayoutChildGidBuilderImpl!ConstraintLayoutChildGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ConstraintLayoutChild build() nothrow
  {
    return new ConstraintLayoutChild(cast(void*)createGObject(ConstraintLayoutChild._getGType), Yes.Take);
  }
}
