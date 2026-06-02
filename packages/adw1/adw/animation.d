/// Module for [Animation] class
module adw.animation;

public import gid.basictypes;
import adw.animation_target;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import gtk.widget;

/**
    A base class for animations.
    
    [adw.animation.Animation] represents an animation on a widget. It has a target that
    provides a value to animate, and a state indicating whether the
    animation hasn't been started yet, is playing, paused or finished.
    
    Currently there are two concrete animation types:
    [adw.timed_animation.TimedAnimation] and [adw.spring_animation.SpringAnimation].
    
    [adw.animation.Animation] will automatically skip the animation if
    [adw.animation.Animation.widget] is unmapped, or if
    [gtk.settings.Settings.gtkEnableAnimations] is `FALSE`.
    
    The [adw.animation.Animation.done] signal can be used to perform an action after
    the animation ends, for example hiding a widget after animating its
    [gtk.widget.Widget.opacity] to 0.
    
    [adw.animation.Animation] will be kept alive while the animation is playing. As such,
    it's safe to create an animation, start it and immediately unref it:
    A fire-and-forget animation:
    
    ```c
    static void
    animation_cb (double    value,
                  MyObject *self)
    {
      // Do something with @value
    }
    
    static void
    my_object_animate (MyObject *self)
    {
      AdwAnimationTarget *target =
        adw_callback_animation_target_new ((AdwAnimationTargetFunc) animation_cb,
                                           self, NULL);
      g_autoptr (AdwAnimation) animation =
        adw_timed_animation_new (widget, 0, 1, 250, target);
    
      adw_animation_play (animation);
    }
    ```
    
    If there's a chance the previous animation for the same target hasn't yet
    finished, the previous animation should be stopped first, or the existing
    [adw.animation.Animation] object can be reused.
*/
class Animation : gobject.object.ObjectWrap
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
    return cast(void function())adw_animation_get_type != &gidSymbolNotFound ? adw_animation_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Animation self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.animation.Animation]
      Returns: New builder object
  */
  static AnimationGidBuilder builder() nothrow
  {
    return new AnimationGidBuilder;
  }

  /**
      Get `followEnableAnimationsSetting` property.
      Returns: Whether to skip the animation when animations are globally disabled.
        
        The default behavior is to skip the animation. Set to `FALSE` to disable
        this behavior.
        
        This can be useful for cases where animation is essential, like spinners,
        or in demo applications. Most other animations should keep it enabled.
        
        See [gtk.settings.Settings.gtkEnableAnimations].
  */
  @property bool followEnableAnimationsSetting() nothrow
  {
    return getFollowEnableAnimationsSetting();
  }

  /**
      Set `followEnableAnimationsSetting` property.
      Params:
        propval = Whether to skip the animation when animations are globally disabled.
          
          The default behavior is to skip the animation. Set to `FALSE` to disable
          this behavior.
          
          This can be useful for cases where animation is essential, like spinners,
          or in demo applications. Most other animations should keep it enabled.
          
          See [gtk.settings.Settings.gtkEnableAnimations].
  */
  @property void followEnableAnimationsSetting(bool propval) nothrow
  {
    setFollowEnableAnimationsSetting(propval);
  }

  /**
      Get `state` property.
      Returns: The animation state.
        
        The state indicates whether the animation is currently playing, paused,
        finished or hasn't been started yet.
  */
  @property adw.types.AnimationState state() nothrow
  {
    return getState();
  }

  /**
      Get `target` property.
      Returns: The target to animate.
  */
  @property adw.animation_target.AnimationTarget target() nothrow
  {
    return getTarget();
  }

  /**
      Set `target` property.
      Params:
        propval = The target to animate.
  */
  @property void target(adw.animation_target.AnimationTarget propval) nothrow
  {
    setTarget(propval);
  }

  /**
      Get `value` property.
      Returns: The current value of the animation.
  */
  @property double value() nothrow
  {
    return getValue();
  }

  /**
      Get `widget` property.
      Returns: The animation widget.
        
        It provides the frame clock for the animation. It's not strictly necessary
        for this widget to be same as the one being animated.
        
        The widget must be mapped in order for the animation to work. If it's not
        mapped, or if it gets unmapped during an ongoing animation, the animation
        will be automatically skipped.
  */
  @property gtk.widget.Widget widget() nothrow
  {
    return getWidget();
  }

  /**
      Gets whether self should be skipped when animations are globally disabled.
      Returns: whether to follow the global setting
  */
  bool getFollowEnableAnimationsSetting() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_animation_get_follow_enable_animations_setting(cast(AdwAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current value of self.
      
      The state indicates whether self is currently playing, paused, finished or
      hasn't been started yet.
      Returns: the animation value
  */
  adw.types.AnimationState getState() nothrow
  {
    AdwAnimationState _cretval;
    _cretval = adw_animation_get_state(cast(AdwAnimation*)this._cPtr);
    adw.types.AnimationState _retval = cast(adw.types.AnimationState)_cretval;
    return _retval;
  }

  /**
      Gets the target self animates.
      Returns: the animation target
  */
  adw.animation_target.AnimationTarget getTarget() nothrow
  {
    AdwAnimationTarget* _cretval;
    _cretval = adw_animation_get_target(cast(AdwAnimation*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.animation_target.AnimationTarget)(cast(AdwAnimationTarget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current value of self.
      Returns: the current value
  */
  double getValue() nothrow
  {
    double _retval;
    _retval = adw_animation_get_value(cast(AdwAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Gets the widget self was created for.
      
      It provides the frame clock for the animation. It's not strictly necessary
      for this widget to be same as the one being animated.
      
      The widget must be mapped in order for the animation to work. If it's not
      mapped, or if it gets unmapped during an ongoing animation, the animation
      will be automatically skipped.
      Returns: the animation widget
  */
  gtk.widget.Widget getWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_animation_get_widget(cast(AdwAnimation*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Pauses a playing animation for self.
      
      Does nothing if the current state of self isn't [adw.types.AnimationState.Playing].
      
      Sets [adw.animation.Animation.state] to [adw.types.AnimationState.Paused].
  */
  void pause() nothrow
  {
    adw_animation_pause(cast(AdwAnimation*)this._cPtr);
  }

  /**
      Starts the animation for self.
      
      If the animation is playing, paused or has been completed, restarts it from
      the beginning. This allows to easily play an animation regardless of whether
      it's already playing or not.
      
      Sets [adw.animation.Animation.state] to [adw.types.AnimationState.Playing].
      
      The animation will be automatically skipped if [adw.animation.Animation.widget] is
      unmapped, or if [gtk.settings.Settings.gtkEnableAnimations] is `FALSE`.
      
      As such, it's not guaranteed that the animation will actually run. For
      example, when using `funcGLib.idle_add` and starting an animation
      immediately afterwards, it's entirely possible that the idle callback will
      run after the animation has already finished, and not while it's playing.
  */
  void play() nothrow
  {
    adw_animation_play(cast(AdwAnimation*)this._cPtr);
  }

  /**
      Resets the animation for self.
      
      Sets [adw.animation.Animation.state] to [adw.types.AnimationState.Idle].
  */
  void reset() nothrow
  {
    adw_animation_reset(cast(AdwAnimation*)this._cPtr);
  }

  /**
      Resumes a paused animation for self.
      
      This function must only be used if the animation has been paused with
      [adw.animation.Animation.pause].
      
      Sets [adw.animation.Animation.state] to [adw.types.AnimationState.Playing].
  */
  void resume() nothrow
  {
    adw_animation_resume(cast(AdwAnimation*)this._cPtr);
  }

  /**
      Sets whether to skip self when animations are globally disabled.
      
      The default behavior is to skip the animation. Set to `FALSE` to disable this
      behavior.
      
      This can be useful for cases where animation is essential, like spinners, or
      in demo applications. Most other animations should keep it enabled.
      
      See [gtk.settings.Settings.gtkEnableAnimations].
  
      Params:
        setting = whether to follow the global setting
  */
  void setFollowEnableAnimationsSetting(bool setting) nothrow
  {
    adw_animation_set_follow_enable_animations_setting(cast(AdwAnimation*)this._cPtr, setting);
  }

  /**
      Sets the target self animates to target.
  
      Params:
        target = an animation target
  */
  void setTarget(adw.animation_target.AnimationTarget target) nothrow
  {
    adw_animation_set_target(cast(AdwAnimation*)this._cPtr, target ? cast(AdwAnimationTarget*)target._cPtr(No.Dup) : null);
  }

  /**
      Skips the animation for self.
      
      If the animation hasn't been started yet, is playing, or is paused, instantly
      skips the animation to the end and causes [adw.animation.Animation.done] to be
      emitted.
      
      Sets [adw.animation.Animation.state] to [adw.types.AnimationState.Finished].
  */
  void skip() nothrow
  {
    adw_animation_skip(cast(AdwAnimation*)this._cPtr);
  }

  /**
      Connect to `Done` signal.
  
      This signal is emitted when the animation has been completed, either on its
        own or via calling [adw.animation.Animation.skip].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(adw.animation.Animation animation)`
  
          `animation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDone(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.animation.Animation)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "adw.animation.Animation.done");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("done", closure, after);
  }
}

/// Fluent builder implementation template for [adw.animation.Animation]
class AnimationGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `followEnableAnimationsSetting` property.
      Params:
        propval = Whether to skip the animation when animations are globally disabled.
          
          The default behavior is to skip the animation. Set to `FALSE` to disable
          this behavior.
          
          This can be useful for cases where animation is essential, like spinners,
          or in demo applications. Most other animations should keep it enabled.
          
          See [gtk.settings.Settings.gtkEnableAnimations].
      Returns: Builder instance for fluent chaining
  */
  T followEnableAnimationsSetting(bool propval) nothrow
  {
    return setProperty("follow-enable-animations-setting", propval);
  }

  /**
      Set `target` property.
      Params:
        propval = The target to animate.
      Returns: Builder instance for fluent chaining
  */
  T target(adw.animation_target.AnimationTarget propval) nothrow
  {
    return setProperty("target", propval);
  }

  /**
      Set `widget` property.
      Params:
        propval = The animation widget.
          
          It provides the frame clock for the animation. It's not strictly necessary
          for this widget to be same as the one being animated.
          
          The widget must be mapped in order for the animation to work. If it's not
          mapped, or if it gets unmapped during an ongoing animation, the animation
          will be automatically skipped.
      Returns: Builder instance for fluent chaining
  */
  T widget(gtk.widget.Widget propval) nothrow
  {
    return setProperty("widget", propval);
  }
}

/// Fluent builder for [adw.animation.Animation]
final class AnimationGidBuilder : AnimationGidBuilderImpl!AnimationGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Animation build() nothrow
  {
    return new Animation(cast(void*)createGObject(Animation._getGType), No.Take);
  }
}
