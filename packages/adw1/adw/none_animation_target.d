/// Module for [NoneAnimationTarget] class
module adw.none_animation_target;

public import gid.basictypes;
import adw.animation_target;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.gid_builder;

/**
    An [adw.animation_target.AnimationTarget] that doesn't do anything.
*/
class NoneAnimationTarget : adw.animation_target.AnimationTarget
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
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
      Get builder for [adw.none_animation_target.NoneAnimationTarget]
      Returns: New builder object
  */
  static NoneAnimationTargetGidBuilder builder() nothrow
  {
    return new NoneAnimationTargetGidBuilder;
  }

  /**
      Creates a new [adw.animation_target.AnimationTarget] that doesn't do anything.
      Returns: the newly created target
  */
  this() nothrow
  {
    AdwAnimationTarget* _cretval;
    _cretval = adw_none_animation_target_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [adw.none_animation_target.NoneAnimationTarget]
class NoneAnimationTargetGidBuilderImpl(T) : adw.animation_target.AnimationTargetGidBuilderImpl!T
{
}

/// Fluent builder for [adw.none_animation_target.NoneAnimationTarget]
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
