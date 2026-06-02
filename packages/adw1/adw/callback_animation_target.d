/// Module for [CallbackAnimationTarget] class
module adw.callback_animation_target;

public import gid.basictypes;
import adw.animation_target;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.gid_builder;

/**
    An [adw.animation_target.AnimationTarget] that calls a given callback during the
    animation.
*/
class CallbackAnimationTarget : adw.animation_target.AnimationTarget
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
    return cast(void function())adw_callback_animation_target_get_type != &gidSymbolNotFound ? adw_callback_animation_target_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CallbackAnimationTarget self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.callback_animation_target.CallbackAnimationTarget]
      Returns: New builder object
  */
  static CallbackAnimationTargetGidBuilder builder() nothrow
  {
    return new CallbackAnimationTargetGidBuilder;
  }

  /**
      Creates a new [adw.animation_target.AnimationTarget] that calls the given callback during
      the animation.
  
      Params:
        callback = the callback to call
      Returns: the newly created callback target
  */
  this(adw.types.AnimationTargetFunc callback) nothrow
  {
    extern(C) void _callbackCallback(double value, void* userData) nothrow
    {
      auto _dlg = cast(adw.types.AnimationTargetFunc*)userData;

      try
      {
        (*_dlg)(value);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "adw.types.AnimationTargetFunc");
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

/// Fluent builder implementation template for [adw.callback_animation_target.CallbackAnimationTarget]
class CallbackAnimationTargetGidBuilderImpl(T) : adw.animation_target.AnimationTargetGidBuilderImpl!T
{
}

/// Fluent builder for [adw.callback_animation_target.CallbackAnimationTarget]
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
