/// Module for [CallbackAnimationTarget] class
module adw.callback_animation_target;

import adw.animation_target;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;

/**
    An `class@AnimationTarget` that calls a given callback during the
    animation.
*/
class CallbackAnimationTarget : adw.animation_target.AnimationTarget
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
    return cast(void function())adw_callback_animation_target_get_type != &gidSymbolNotFound ? adw_callback_animation_target_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CallbackAnimationTarget self()
  {
    return this;
  }

  /**
      Creates a new [adw.animation_target.AnimationTarget] that calls the given callback during
      the animation.
  
      Params:
        callback = the callback to call
      Returns: the newly created callback target
  */
  this(adw.types.AnimationTargetFunc callback)
  {
    extern(C) void _callbackCallback(double value, void* userData)
    {
      auto _dlg = cast(adw.types.AnimationTargetFunc*)userData;

      (*_dlg)(value);
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    AdwAnimationTarget* _cretval;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    _cretval = adw_callback_animation_target_new(_callbackCB, _callback, _callbackDestroyCB);
    this(_cretval, Yes.Take);
  }
}
