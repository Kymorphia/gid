/// Module for [AnimationTarget] class
module gid.adw1.animation_target;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Represents a value [gid.adw1.animation.Animation] can animate.
*/
class AnimationTarget : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())adw_animation_target_get_type != &gidSymbolNotFound ? adw_animation_target_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwAnimationTarget";
  }

  /** Returns `this`, for use in `with` statements. */
  override AnimationTarget self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.animation_target.AnimationTarget]
      Returns: New builder object
  */
  static AnimationTargetGidBuilder builder() nothrow
  {
    return new AnimationTargetGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.adw1.animation_target.AnimationTarget]
class AnimationTargetGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.adw1.animation_target.AnimationTarget]
final class AnimationTargetGidBuilder : AnimationTargetGidBuilderImpl!AnimationTargetGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AnimationTarget build() nothrow
  {
    return new AnimationTarget(cast(void*)createGObject(AnimationTarget._getGType), Yes.Take);
  }
}
