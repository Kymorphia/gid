/// Module for [AnimationTarget] class
module adw.animation_target;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/**
    Represents a value `class@Animation` can animate.
*/
class AnimationTarget : gobject.object.ObjectWrap
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
    return cast(void function())adw_animation_target_get_type != &gidSymbolNotFound ? adw_animation_target_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AnimationTarget self()
  {
    return this;
  }

  /**
  Get builder for [adw.animation_target.AnimationTarget]
  Returns: New builder object
  */
  static AnimationTargetGidBuilder builder()
  {
    return new AnimationTargetGidBuilder;
  }
}

class AnimationTargetGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [adw.animation_target.AnimationTarget]
final class AnimationTargetGidBuilder : AnimationTargetGidBuilderImpl!AnimationTargetGidBuilder
{
  AnimationTarget build()
  {
    return new AnimationTarget(cast(void*)createGObject(AnimationTarget._getGType), No.Take);
  }
}
