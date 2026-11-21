/// Module for [CallbackAnimationTarget] class
module gid.adw1.callback_animation_target;

public import gid.core.basictypes;
import gid.adw1.animation_target;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.core.gid;
import gid.gobject2.gid_builder;

/**
    An [gid.adw1.animation_target.AnimationTarget] that calls a given callback during the
    animation.
*/
class CallbackAnimationTarget : gid.adw1.animation_target.AnimationTarget
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
    return cast(void function())adw_callback_animation_target_get_type != &gidSymbolNotFound ? adw_callback_animation_target_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwCallbackAnimationTarget";
  }

  /** Returns `this`, for use in `with` statements. */
  override CallbackAnimationTarget self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.callback_animation_target.CallbackAnimationTarget]
      Returns: New builder object
  */
  static CallbackAnimationTargetGidBuilder builder() nothrow
  {
    return new CallbackAnimationTargetGidBuilder;
  }

  /**
      Creates a new [gid.adw1.animation_target.AnimationTarget] that calls the given callback during
      the animation.
  
      Params:
        callback = the callback to call
      Returns: the newly created callback target
  */
  this(gid.adw1.types.AnimationTargetFunc callback) nothrow
  {
    extern(C) void _callbackCallback(double value, void* userData) nothrow
    {
      auto _dlg = cast(gid.adw1.types.AnimationTargetFunc*)userData;

      try
      {
        (*_dlg)(value);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.adw1.types.AnimationTargetFunc");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    AdwAnimationTarget* _cretval;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    _cretval = adw_callback_animation_target_new(_callbackCB, _callback, _callbackDestroyCB);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gid.adw1.callback_animation_target.CallbackAnimationTarget]
class CallbackAnimationTargetGidBuilderImpl(T) : gid.adw1.animation_target.AnimationTargetGidBuilderImpl!T
{
}

/// Fluent builder for [gid.adw1.callback_animation_target.CallbackAnimationTarget]
final class CallbackAnimationTargetGidBuilder : CallbackAnimationTargetGidBuilderImpl!CallbackAnimationTargetGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CallbackAnimationTarget build() nothrow
  {
    return new CallbackAnimationTarget(cast(void*)createGObject(CallbackAnimationTarget._getGType), Yes.Take);
  }
}
