/// Module for [LockButtonAccessible] class
module gtk.lock_button_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.image;
import atk.image_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.button_accessible;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/** */
class LockButtonAccessible : gtk.button_accessible.ButtonAccessible
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
    return cast(void function())gtk_lock_button_accessible_get_type != &gidSymbolNotFound ? gtk_lock_button_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LockButtonAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.lock_button_accessible.LockButtonAccessible]
      Returns: New builder object
  */
  static LockButtonAccessibleGidBuilder builder()
  {
    return new LockButtonAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gtk.lock_button_accessible.LockButtonAccessible]
class LockButtonAccessibleGidBuilderImpl(T) : gtk.button_accessible.ButtonAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.lock_button_accessible.LockButtonAccessible]
final class LockButtonAccessibleGidBuilder : LockButtonAccessibleGidBuilderImpl!LockButtonAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  LockButtonAccessible build()
  {
    return new LockButtonAccessible(cast(void*)createGObject(LockButtonAccessible._getGType), No.Take);
  }
}
