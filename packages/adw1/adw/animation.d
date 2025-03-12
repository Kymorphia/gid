module adw.animation;

import adw.animation_target;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.widget;

/**
    A base class for animations.
  
  [adw.animation.Animation] represents an animation on a widget. It has a target that
  provides a value to animate, and a state indicating whether the
  animation hasn't been started yet, is playing, paused or finished.
  
  Currently there are two concrete animation types:
  `class@TimedAnimation` and `class@SpringAnimation`.
  
  [adw.animation.Animation] will automatically skip the animation if
  `property@Animation:widget` is unmapped, or if
  `property@Gtk.Settings:gtk-enable-animations` is `FALSE`.
  
  The `signal@Animation::done` signal can be used to perform an action after
  the animation ends, for example hiding a widget after animating its
  [gtk.widget.Widget.gdouble] to 0.
  
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
class Animation : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_animation_get_type != &gidSymbolNotFound ? adw_animation_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override Animation self()
  {
    return this;
  }

  /**
      Gets whether self should be skipped when animations are globally disabled.
    Returns:     whether to follow the global setting
  */
  bool getFollowEnableAnimationsSetting()
  {
    bool _retval;
    _retval = adw_animation_get_follow_enable_animations_setting(cast(AdwAnimation*)cPtr);
    return _retval;
  }

  /**
      Gets the current value of self.
    
    The state indicates whether self is currently playing, paused, finished or
    hasn't been started yet.
    Returns:     the animation value
  */
  adw.types.AnimationState getState()
  {
    AdwAnimationState _cretval;
    _cretval = adw_animation_get_state(cast(AdwAnimation*)cPtr);
    adw.types.AnimationState _retval = cast(adw.types.AnimationState)_cretval;
    return _retval;
  }

  /**
      Gets the target self animates.
    Returns:     the animation target
  */
  adw.animation_target.AnimationTarget getTarget()
  {
    AdwAnimationTarget* _cretval;
    _cretval = adw_animation_get_target(cast(AdwAnimation*)cPtr);
    auto _retval = ObjectG.getDObject!(adw.animation_target.AnimationTarget)(cast(AdwAnimationTarget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current value of self.
    Returns:     the current value
  */
  double getValue()
  {
    double _retval;
    _retval = adw_animation_get_value(cast(AdwAnimation*)cPtr);
    return _retval;
  }

  /**
      Gets the widget self was created for.
    
    It provides the frame clock for the animation. It's not strictly necessary
    for this widget to be same as the one being animated.
    
    The widget must be mapped in order for the animation to work. If it's not
    mapped, or if it gets unmapped during an ongoing animation, the animation
    will be automatically skipped.
    Returns:     the animation widget
  */
  gtk.widget.Widget getWidget()
  {
    GtkWidget* _cretval;
    _cretval = adw_animation_get_widget(cast(AdwAnimation*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Pauses a playing animation for self.
    
    Does nothing if the current state of self isn't [adw.types.AnimationState.Playing].
    
    Sets `propertyAnimation:state` to [adw.types.AnimationState.Paused].
  */
  void pause()
  {
    adw_animation_pause(cast(AdwAnimation*)cPtr);
  }

  /**
      Starts the animation for self.
    
    If the animation is playing, paused or has been completed, restarts it from
    the beginning. This allows to easily play an animation regardless of whether
    it's already playing or not.
    
    Sets `propertyAnimation:state` to [adw.types.AnimationState.Playing].
    
    The animation will be automatically skipped if `propertyAnimation:widget` is
    unmapped, or if `propertyGtk.Settings:gtk-enable-animations` is `FALSE`.
    
    As such, it's not guaranteed that the animation will actually run. For
    example, when using `funcGLib.idle_add` and starting an animation
    immediately afterwards, it's entirely possible that the idle callback will
    run after the animation has already finished, and not while it's playing.
  */
  void play()
  {
    adw_animation_play(cast(AdwAnimation*)cPtr);
  }

  /**
      Resets the animation for self.
    
    Sets `propertyAnimation:state` to [adw.types.AnimationState.Idle].
  */
  void reset()
  {
    adw_animation_reset(cast(AdwAnimation*)cPtr);
  }

  /**
      Resumes a paused animation for self.
    
    This function must only be used if the animation has been paused with
    [adw.animation.Animation.pause].
    
    Sets `propertyAnimation:state` to [adw.types.AnimationState.Playing].
  */
  void resume()
  {
    adw_animation_resume(cast(AdwAnimation*)cPtr);
  }

  /**
      Sets whether to skip self when animations are globally disabled.
    
    The default behavior is to skip the animation. Set to `FALSE` to disable this
    behavior.
    
    This can be useful for cases where animation is essential, like spinners, or
    in demo applications. Most other animations should keep it enabled.
    
    See `propertyGtk.Settings:gtk-enable-animations`.
    Params:
      setting =       whether to follow the global setting
  */
  void setFollowEnableAnimationsSetting(bool setting)
  {
    adw_animation_set_follow_enable_animations_setting(cast(AdwAnimation*)cPtr, setting);
  }

  /**
      Sets the target self animates to target.
    Params:
      target =       an animation target
  */
  void setTarget(adw.animation_target.AnimationTarget target)
  {
    adw_animation_set_target(cast(AdwAnimation*)cPtr, target ? cast(AdwAnimationTarget*)target.cPtr(No.Dup) : null);
  }

  /**
      Skips the animation for self.
    
    If the animation hasn't been started yet, is playing, or is paused, instantly
    skips the animation to the end and causes `signalAnimation::done` to be
    emitted.
    
    Sets `propertyAnimation:state` to [adw.types.AnimationState.Finished].
  */
  void skip()
  {
    adw_animation_skip(cast(AdwAnimation*)cPtr);
  }

  /**
      This signal is emitted when the animation has been completed, either on its
    own or via calling [adw.animation.Animation.skip].
  
    ## Parameters
    $(LIST
      * $(B animation) the instance the signal is connected to
    )
  */
  alias DoneCallbackDlg = void delegate(adw.animation.Animation animation);

  /** ditto */
  alias DoneCallbackFunc = void function(adw.animation.Animation animation);

  /**
    Connect to Done signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDone(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DoneCallbackDlg) || is(T : DoneCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto animation = getVal!(adw.animation.Animation)(_paramVals);
      _dClosure.dlg(animation);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("done", closure, after);
  }
}
