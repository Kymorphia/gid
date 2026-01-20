/// Module for [TimedAnimation] class
module adw.timed_animation;

import adw.animation;
import adw.animation_target;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gtk.widget;

/**
    A time-based `class@Animation`.
    
    [adw.timed_animation.TimedAnimation] implements a simple animation interpolating the given
    value from `property@TimedAnimation:value-from` to
    `property@TimedAnimation:value-to` over
    `property@TimedAnimation:duration` milliseconds using the curve described by
    `property@TimedAnimation:easing`.
    
    If `property@TimedAnimation:reverse` is set to `TRUE`, [adw.timed_animation.TimedAnimation]
    will instead animate from `property@TimedAnimation:value-to` to
    `property@TimedAnimation:value-from`, and the easing curve will be inverted.
    
    The animation can repeat a certain amount of times, or endlessly, depending
    on the `property@TimedAnimation:repeat-count` value. If
    `property@TimedAnimation:alternate` is set to `TRUE`, it will also change the
    direction every other iteration.
*/
class TimedAnimation : adw.animation.Animation
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
    return cast(void function())adw_timed_animation_get_type != &gidSymbolNotFound ? adw_timed_animation_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TimedAnimation self()
  {
    return this;
  }

  /**
      Get `alternate` property.
      Returns: Whether the animation changes direction on every iteration.
  */
  @property bool alternate()
  {
    return getAlternate();
  }

  /**
      Set `alternate` property.
      Params:
        propval = Whether the animation changes direction on every iteration.
  */
  @property void alternate(bool propval)
  {
    return setAlternate(propval);
  }

  /**
      Get `duration` property.
      Returns: Duration of the animation, in milliseconds.
        
        Describes how much time the animation will take.
        
        If the animation repeats more than once, describes the duration of one
        iteration.
  */
  @property uint duration()
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
  @property void duration(uint propval)
  {
    return setDuration(propval);
  }

  /**
      Get `easing` property.
      Returns: Easing function used in the animation.
        
        Describes the curve the value is interpolated on.
        
        See `enum@Easing` for the description of specific easing functions.
  */
  @property adw.types.Easing easing()
  {
    return getEasing();
  }

  /**
      Set `easing` property.
      Params:
        propval = Easing function used in the animation.
          
          Describes the curve the value is interpolated on.
          
          See `enum@Easing` for the description of specific easing functions.
  */
  @property void easing(adw.types.Easing propval)
  {
    return setEasing(propval);
  }

  /**
      Get `repeatCount` property.
      Returns: Number of times the animation will play.
        
        If set to 0, the animation will repeat endlessly.
  */
  @property uint repeatCount()
  {
    return getRepeatCount();
  }

  /**
      Set `repeatCount` property.
      Params:
        propval = Number of times the animation will play.
          
          If set to 0, the animation will repeat endlessly.
  */
  @property void repeatCount(uint propval)
  {
    return setRepeatCount(propval);
  }

  /**
      Get `reverse` property.
      Returns: Whether the animation plays backwards.
  */
  @property bool reverse()
  {
    return getReverse();
  }

  /**
      Set `reverse` property.
      Params:
        propval = Whether the animation plays backwards.
  */
  @property void reverse(bool propval)
  {
    return setReverse(propval);
  }

  /**
      Get `valueFrom` property.
      Returns: The value to animate from.
        
        The animation will start at this value and end at
        `property@TimedAnimation:value-to`.
        
        If `property@TimedAnimation:reverse` is `TRUE`, the animation will end at
        this value instead.
  */
  @property double valueFrom()
  {
    return getValueFrom();
  }

  /**
      Set `valueFrom` property.
      Params:
        propval = The value to animate from.
          
          The animation will start at this value and end at
          `property@TimedAnimation:value-to`.
          
          If `property@TimedAnimation:reverse` is `TRUE`, the animation will end at
          this value instead.
  */
  @property void valueFrom(double propval)
  {
    return setValueFrom(propval);
  }

  /**
      Get `valueTo` property.
      Returns: The value to animate to.
        
        The animation will start at `property@TimedAnimation:value-from` and end at
        this value.
        
        If `property@TimedAnimation:reverse` is `TRUE`, the animation will start
        at this value instead.
  */
  @property double valueTo()
  {
    return getValueTo();
  }

  /**
      Set `valueTo` property.
      Params:
        propval = The value to animate to.
          
          The animation will start at `property@TimedAnimation:value-from` and end at
          this value.
          
          If `property@TimedAnimation:reverse` is `TRUE`, the animation will start
          at this value instead.
  */
  @property void valueTo(double propval)
  {
    return setValueTo(propval);
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
  this(gtk.widget.Widget widget, double from, double to, uint duration, adw.animation_target.AnimationTarget target)
  {
    AdwAnimation* _cretval;
    _cretval = adw_timed_animation_new(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, from, to, duration, target ? cast(AdwAnimationTarget*)target._cPtr(Yes.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Gets whether self changes direction on every iteration.
      Returns: whether self alternates
  */
  bool getAlternate()
  {
    bool _retval;
    _retval = cast(bool)adw_timed_animation_get_alternate(cast(AdwTimedAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Gets the duration of self.
      Returns: the duration of self, in milliseconds
  */
  uint getDuration()
  {
    uint _retval;
    _retval = adw_timed_animation_get_duration(cast(AdwTimedAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Gets the easing function self uses.
      Returns: the easing function self uses
  */
  adw.types.Easing getEasing()
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
  uint getRepeatCount()
  {
    uint _retval;
    _retval = adw_timed_animation_get_repeat_count(cast(AdwTimedAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether self plays backwards.
      Returns: whether self plays backwards
  */
  bool getReverse()
  {
    bool _retval;
    _retval = cast(bool)adw_timed_animation_get_reverse(cast(AdwTimedAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value self will animate from.
      Returns: the value to animate from
  */
  double getValueFrom()
  {
    double _retval;
    _retval = adw_timed_animation_get_value_from(cast(AdwTimedAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value self will animate to.
      Returns: the value to animate to
  */
  double getValueTo()
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
  void setAlternate(bool alternate)
  {
    adw_timed_animation_set_alternate(cast(AdwTimedAnimation*)this._cPtr, alternate);
  }

  /**
      Sets the duration of self.
      
      If the animation repeats more than once, sets the duration of one iteration.
  
      Params:
        duration = the duration to use, in milliseconds
  */
  void setDuration(uint duration)
  {
    adw_timed_animation_set_duration(cast(AdwTimedAnimation*)this._cPtr, duration);
  }

  /**
      Sets the easing function self will use.
      
      See `enumEasing` for the description of specific easing functions.
  
      Params:
        easing = the easing function to use
  */
  void setEasing(adw.types.Easing easing)
  {
    adw_timed_animation_set_easing(cast(AdwTimedAnimation*)this._cPtr, easing);
  }

  /**
      Sets the number of times self will play.
      
      If set to 0, self will repeat endlessly.
  
      Params:
        repeatCount = the number of times self will play
  */
  void setRepeatCount(uint repeatCount)
  {
    adw_timed_animation_set_repeat_count(cast(AdwTimedAnimation*)this._cPtr, repeatCount);
  }

  /**
      Sets whether self plays backwards.
  
      Params:
        reverse = whether self plays backwards
  */
  void setReverse(bool reverse)
  {
    adw_timed_animation_set_reverse(cast(AdwTimedAnimation*)this._cPtr, reverse);
  }

  /**
      Sets the value self will animate from.
      
      The animation will start at this value and end at
      `propertyTimedAnimation:value-to`.
      
      If `propertyTimedAnimation:reverse` is `TRUE`, the animation will end at
      this value instead.
  
      Params:
        value = the value to animate from
  */
  void setValueFrom(double value)
  {
    adw_timed_animation_set_value_from(cast(AdwTimedAnimation*)this._cPtr, value);
  }

  /**
      Sets the value self will animate to.
      
      The animation will start at `propertyTimedAnimation:value-from` and end at
      this value.
      
      If `propertyTimedAnimation:reverse` is `TRUE`, the animation will start
      at this value instead.
  
      Params:
        value = the value to animate to
  */
  void setValueTo(double value)
  {
    adw_timed_animation_set_value_to(cast(AdwTimedAnimation*)this._cPtr, value);
  }
}
