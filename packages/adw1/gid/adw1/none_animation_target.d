/// Module for [NoneAnimationTarget] class
module gid.adw1.none_animation_target;

public import gid.core.basictypes;
import gid.adw1.animation_target;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.core.gid;
import gid.gobject2.gid_builder;

/**
    An [gid.adw1.animation_target.AnimationTarget] that doesn't do anything.
*/
class NoneAnimationTarget : gid.adw1.animation_target.AnimationTarget
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
    return cast(void function())adw_none_animation_target_get_type != &gidSymbolNotFound ? adw_none_animation_target_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwNoneAnimationTarget";
  }

  /** Returns `this`, for use in `with` statements. */
  override NoneAnimationTarget self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.none_animation_target.NoneAnimationTarget]
      Returns: New builder object
  */
  static NoneAnimationTargetGidBuilder builder() nothrow
  {
    return new NoneAnimationTargetGidBuilder;
  }

  /**
      Creates a new [gid.adw1.animation_target.AnimationTarget] that doesn't do anything.
      Returns: the newly created target
  */
  this() nothrow
  {
    AdwAnimationTarget* _cretval;
    _cretval = adw_none_animation_target_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gid.adw1.none_animation_target.NoneAnimationTarget]
class NoneAnimationTargetGidBuilderImpl(T) : gid.adw1.animation_target.AnimationTargetGidBuilderImpl!T
{
}

/// Fluent builder for [gid.adw1.none_animation_target.NoneAnimationTarget]
final class NoneAnimationTargetGidBuilder : NoneAnimationTargetGidBuilderImpl!NoneAnimationTargetGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NoneAnimationTarget build() nothrow
  {
    return new NoneAnimationTarget(cast(void*)createGObject(NoneAnimationTarget._getGType), Yes.Take);
  }
}
