/// Module for [ConstraintLayoutChild] class
module gtk.constraint_layout_child;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.layout_child;
import gtk.types;

/**
    [gtk.layout_child.LayoutChild] subclass for children in a [gtk.constraint_layout.ConstraintLayout].
*/
class ConstraintLayoutChild : gtk.layout_child.LayoutChild
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_constraint_layout_child_get_type != &gidSymbolNotFound ? gtk_constraint_layout_child_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ConstraintLayoutChild self()
  {
    return this;
  }
}
