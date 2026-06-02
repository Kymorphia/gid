/// Module for [TimedAnimation] class
module adw.timed_animation;

public import gid.basictypes;
import adw.animation;
import adw.animation_target;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.gid_builder;
import gtk.widget;

/**
    A time-based [adw.animation.Animation].
    
    [adw.timed_animation.TimedAnimation] implements a simple animation interpolating the given
    value from [adw.timed_animation.TimedAnimation.valueFrom] to
    [adw.timed_animation.TimedAnimation.valueTo] over
    [adw.timed_animation.TimedAnimation.duration] milliseconds using the curve described by
    [adw.timed_animation.TimedAnimation.easing].
    
    If [adw.timed_animation.TimedAnimation.reverse] is set to `TRUE`, [adw.timed_animation.TimedAnimation]
    will instead animate from [adw.timed_animation.TimedAnimation.valueTo] to
    [adw.timed_animation.TimedAnimation.valueFrom], and the easing curve will be inverted.
    
    The animation can repeat a certain amount of times, or endlessly, depending
    on the [adw.timed_animation.TimedAnimation.repeatCount] value. If
    [adw.timed_animation.TimedAnimation.alternate] is set to `TRUE`, it will also change the
    direction every other iteration.
*/
class TimedAnimation : adw.animation.Animation
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
    return cast(void function())adw_timed_animation_get_type != &gidSymbolNotFound ? adw_timed_animation_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TimedAnimation self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.timed_animation.TimedAnimation]
      Returns: New builder object
  */
  static TimedAnimationGidBuilder builder() nothrow
  {
    return new TimedAnimationGidBuilder;
  }

  /**
      Get `alternate` property.
      Returns: Whether the animation changes direction on every iteration.
  */
  @property bool alternate() nothrow
  {
    return getAlternate();
  }

  /**
      Set `alternate` property.
      Params:
        propval = Whether the animation changes direction on every iteration.
  */
  @property void alternate(bool propval) nothrow
  {
    setAlternate(propval);
  }

  /**
      Get `duration` property.
      Returns: Duration of the animation, in milliseconds.
        
        Describes how much time the animation will take.
        
        If the animation repeats more than once, describes the duration of one
        iteration.
  */
  @property uint duration() nothrow
  {
    return getDuration();
  }

  /**
      Set `duration` property.
      Params:
        propval = Duration of the animation, in milliseconds.
          
          Describes how much time the animation will take.
          
          If the animation repeats more than once, describes the duration of one
          iteration.
  */
  @property void duration(uint propval) nothrow
  {
    setDuration(propval);
  }

  /**
      Get `easing` property.
      Returns: Easing function used in the animation.
        
        Describes the curve the value is interpolated on.
        
        See [adw.types.Easing] for the description of specific easing functions.
  */
  @property adw.types.Easing easing() nothrow
  {
    return getEasing();
  }

  /**
      Set `easing` property.
      Params:
        propval = Easing function used in the animation.
          
          Describes the curve the value is interpolated on.
          
          See [adw.types.Easing] for the description of specific easing functions.
  */
  @property void easing(adw.types.Easing propval) nothrow
  {
    setEasing(propval);
  }

  /**
      Get `repeatCount` property.
      Returns: Number of times the animation will play.
        
        If set to 0, the animation will repeat endlessly.
  */
  @property uint repeatCount() nothrow
  {
    return getRepeatCount();
  }

  /**
      Set `repeatCount` property.
      Params:
        propval = Number of times the animation will play.
          
          If set to 0, the animation will repeat endlessly.
  */
  @property void repeatCount(uint propval) nothrow
  {
    setRepeatCount(propval);
  }

  /**
      Get `reverse` property.
      Returns: Whether the animation plays backwards.
  */
  @property bool reverse() nothrow
  {
    return getReverse();
  }

  /**
      Set `reverse` property.
      Params:
        propval = Whether the animation plays backwards.
  */
  @property void reverse(bool propval) nothrow
  {
    setReverse(propval);
  }

  /**
      Get `valueFrom` property.
      Returns: The value to animate from.
        
        The animation will start at this value and end at
        [adw.timed_animation.TimedAnimation.valueTo].
        
        If [adw.timed_animation.TimedAnimation.reverse] is `TRUE`, the animation will end at
        this value instead.
  */
  @property double valueFrom() nothrow
  {
    return getValueFrom();
  }

  /**
      Set `valueFrom` property.
      Params:
        propval = The value to animate from.
          
          The animation will start at this value and end at
          [adw.timed_animation.TimedAnimation.valueTo].
          
          If [adw.timed_animation.TimedAnimation.reverse] is `TRUE`, the animation will end at
          this value instead.
  */
  @property void valueFrom(double propval) nothrow
  {
    setValueFrom(propval);
  }

  /**
      Get `valueTo` property.
      Returns: The value to animate to.
        
        The animation will start at [adw.timed_animation.TimedAnimation.valueFrom] and end at
        this value.
        
        If [adw.timed_animation.TimedAnimation.reverse] is `TRUE`, the animation will start
        at this value instead.
  */
  @property double valueTo() nothrow
  {
    return getValueTo();
  }

  /**
      Set `valueTo` property.
      Params:
        propval = The value to animate to.
          
          The animation will start at [adw.timed_animation.TimedAnimation.valueFrom] and end at
          this value.
          
          If [adw.timed_animation.TimedAnimation.reverse] is `TRUE`, the animation will start
          at this value instead.
  */
  @property void valueTo(double propval) nothrow
  {
    setValueTo(propval);
  }

  /**
      Creates a new [adw.timed_animation.TimedAnimation] on widget to animate target from from
      to to.
  
      Params:
        widget = a widget to create animation on
        from = a value to animate from
        to = a value to animate to
        duration = a duration for the animation
        target = a target value to animate
      Returns: the newly created animation
  */
  this(gtk.widget.Widget widget, double from, double to, uint duration, adw.animation_target.AnimationTarget target) nothrow
  {
    AdwAnimation* _cretval;
    _cretval = adw_timed_animation_new(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, from, to, duration, target ? cast(AdwAnimationTarget*)target._cPtr(Yes.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Gets whether self changes direction on every iteration.
      Returns: whether self alternates
  */
  bool getAlternate() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_timed_animation_get_alternate(cast(AdwTimedAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Gets the duration of self.
      Returns: the duration of self, in milliseconds
  */
  uint getDuration() nothrow
  {
    uint _retval;
    _retval = adw_timed_animation_get_duration(cast(AdwTimedAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Gets the easing function self uses.
      Returns: the easing function self uses
  */
  adw.types.Easing getEasing() nothrow
  {
    AdwEasing _cretval;
    _cretval = adw_timed_animation_get_easing(cast(AdwTimedAnimation*)this._cPtr);
    adw.types.Easing _retval = cast(adw.types.Easing)_cretval;
    return _retval;
  }

  /**
      Gets the number of times self will play.
      Returns: the number of times self will play
  */
  uint getRepeatCount() nothrow
  {
    uint _retval;
    _retval = adw_timed_animation_get_repeat_count(cast(AdwTimedAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether self plays backwards.
      Returns: whether self plays backwards
  */
  bool getReverse() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_timed_animation_get_reverse(cast(AdwTimedAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value self will animate from.
      Returns: the value to animate from
  */
  double getValueFrom() nothrow
  {
    double _retval;
    _retval = adw_timed_animation_get_value_from(cast(AdwTimedAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value self will animate to.
      Returns: the value to animate to
  */
  double getValueTo() nothrow
  {
    double _retval;
    _retval = adw_timed_animation_get_value_to(cast(AdwTimedAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether self changes direction on every iteration.
  
      Params:
        alternate = whether self alternates
  */
  void setAlternate(bool alternate) nothrow
  {
    adw_timed_animation_set_alternate(cast(AdwTimedAnimation*)this._cPtr, alternate);
  }

  /**
      Sets the duration of self.
      
      If the animation repeats more than once, sets the duration of one iteration.
  
      Params:
        duration = the duration to use, in milliseconds
  */
  void setDuration(uint duration) nothrow
  {
    adw_timed_animation_set_duration(cast(AdwTimedAnimation*)this._cPtr, duration);
  }

  /**
      Sets the easing function self will use.
      
      See [adw.types.Easing] for the description of specific easing functions.
  
      Params:
        easing = the easing function to use
  */
  void setEasing(adw.types.Easing easing) nothrow
  {
    adw_timed_animation_set_easing(cast(AdwTimedAnimation*)this._cPtr, easing);
  }

  /**
      Sets the number of times self will play.
      
      If set to 0, self will repeat endlessly.
  
      Params:
        repeatCount = the number of times self will play
  */
  void setRepeatCount(uint repeatCount) nothrow
  {
    adw_timed_animation_set_repeat_count(cast(AdwTimedAnimation*)this._cPtr, repeatCount);
  }

  /**
      Sets whether self plays backwards.
  
      Params:
        reverse = whether self plays backwards
  */
  void setReverse(bool reverse) nothrow
  {
    adw_timed_animation_set_reverse(cast(AdwTimedAnimation*)this._cPtr, reverse);
  }

  /**
      Sets the value self will animate from.
      
      The animation will start at this value and end at
      [adw.timed_animation.TimedAnimation.valueTo].
      
      If [adw.timed_animation.TimedAnimation.reverse] is `TRUE`, the animation will end at
      this value instead.
  
      Params:
        value = the value to animate from
  */
  void setValueFrom(double value) nothrow
  {
    adw_timed_animation_set_value_from(cast(AdwTimedAnimation*)this._cPtr, value);
  }

  /**
      Sets the value self will animate to.
      
      The animation will start at [adw.timed_animation.TimedAnimation.valueFrom] and end at
      this value.
      
      If [adw.timed_animation.TimedAnimation.reverse] is `TRUE`, the animation will start
      at this value instead.
  
      Params:
        value = the value to animate to
  */
  void setValueTo(double value) nothrow
  {
    adw_timed_animation_set_value_to(cast(AdwTimedAnimation*)this._cPtr, value);
  }
}

/// Fluent builder implementation template for [adw.timed_animation.TimedAnimation]
class TimedAnimationGidBuilderImpl(T) : adw.animation.AnimationGidBuilderImpl!T
{

  /**
      Set `alternate` property.
      Params:
        propval = Whether the animation changes direction on every iteration.
      Returns: Builder instance for fluent chaining
  */
  T alternate(bool propval) nothrow
  {
    return setProperty("alternate", propval);
  }

  /**
      Set `duration` property.
      Params:
        propval = Duration of the animation, in milliseconds.
          
          Describes how much time the animation will take.
          
          If the animation repeats more than once, describes the duration of one
          iteration.
      Returns: Builder instance for fluent chaining
  */
  T duration(uint propval) nothrow
  {
    return setProperty("duration", propval);
  }

  /**
      Set `easing` property.
      Params:
        propval = Easing function used in the animation.
          
          Describes the curve the value is interpolated on.
          
          See [adw.types.Easing] for the description of specific easing functions.
      Returns: Builder instance for fluent chaining
  */
  T easing(adw.types.Easing propval) nothrow
  {
    return setProperty("easing", propval);
  }

  /**
      Set `repeatCount` property.
      Params:
        propval = Number of times the animation will play.
          
          If set to 0, the animation will repeat endlessly.
      Returns: Builder instance for fluent chaining
  */
  T repeatCount(uint propval) nothrow
  {
    return setProperty("repeat-count", propval);
  }

  /**
      Set `reverse` property.
      Params:
        propval = Whether the animation plays backwards.
      Returns: Builder instance for fluent chaining
  */
  T reverse(bool propval) nothrow
  {
    return setProperty("reverse", propval);
  }

  /**
      Set `valueFrom` property.
      Params:
        propval = The value to animate from.
          
          The animation will start at this value and end at
          [adw.timed_animation.TimedAnimation.valueTo].
          
          If [adw.timed_animation.TimedAnimation.reverse] is `TRUE`, the animation will end at
          this value instead.
      Returns: Builder instance for fluent chaining
  */
  T valueFrom(double propval) nothrow
  {
    return setProperty("value-from", propval);
  }

  /**
      Set `valueTo` property.
      Params:
        propval = The value to animate to.
          
          The animation will start at [adw.timed_animation.TimedAnimation.valueFrom] and end at
          this value.
          
          If [adw.timed_animation.TimedAnimation.reverse] is `TRUE`, the animation will start
          at this value instead.
      Returns: Builder instance for fluent chaining
  */
  T valueTo(double propval) nothrow
  {
    return setProperty("value-to", propval);
  }
}

/// Fluent builder for [adw.timed_animation.TimedAnimation]
final class TimedAnimationGidBuilder : TimedAnimationGidBuilderImpl!TimedAnimationGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TimedAnimation build() nothrow
  {
    return new TimedAnimation(cast(void*)createGObject(TimedAnimation._getGType), No.Take);
  }
}
