/// Module for [SpringAnimation] class
module adw.spring_animation;

public import gid.basictypes;
import adw.animation;
import adw.animation_target;
import adw.c.functions;
import adw.c.types;
import adw.spring_params;
import adw.types;
import gid.gid;
import gobject.gid_builder;
import gtk.widget;

/**
    A spring-based [adw.animation.Animation].
    
    [adw.spring_animation.SpringAnimation] implements an animation driven by a physical model of a
    spring described by [adw.spring_params.SpringParams], with a resting position in
    [adw.spring_animation.SpringAnimation.valueTo], stretched to
    [adw.spring_animation.SpringAnimation.valueFrom].
    
    Since the animation is physically simulated, spring animations don't have a
    fixed duration. The animation will stop when the simulated spring comes to a
    rest - when the amplitude of the oscillations becomes smaller than
    [adw.spring_animation.SpringAnimation.epsilon], or immediately when it reaches
    [adw.spring_animation.SpringAnimation.valueTo] if
    [adw.spring_animation.SpringAnimation.clamp] is set to `TRUE`. The estimated duration can
    be obtained with [adw.spring_animation.SpringAnimation.estimatedDuration].
    
    Due to the nature of spring-driven motion the animation can overshoot
    [adw.spring_animation.SpringAnimation.valueTo] before coming to a rest. Whether the
    animation will overshoot or not depends on the damping ratio of the spring.
    See [adw.spring_params.SpringParams] for more information about specific damping ratio
    values.
    
    If [adw.spring_animation.SpringAnimation.clamp] is `TRUE`, the animation will abruptly
    end as soon as it reaches the final value, preventing overshooting.
    
    Animations can have an initial velocity value, set via
    [adw.spring_animation.SpringAnimation.initialVelocity], which adjusts the curve without
    changing the duration. This makes spring animations useful for deceleration
    at the end of gestures.
    
    If the initial and final values are equal, and the initial velocity is not 0,
    the animation value will bounce and return to its resting position.
*/
class SpringAnimation : adw.animation.Animation
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
    return cast(void function())adw_spring_animation_get_type != &gidSymbolNotFound ? adw_spring_animation_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SpringAnimation self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.spring_animation.SpringAnimation]
      Returns: New builder object
  */
  static SpringAnimationGidBuilder builder() nothrow
  {
    return new SpringAnimationGidBuilder;
  }

  /**
      Get `clamp` property.
      Returns: Whether the animation should be clamped.
        
        If set to `TRUE`, the animation will abruptly end as soon as it reaches the
        final value, preventing overshooting.
        
        It won't prevent overshooting [adw.spring_animation.SpringAnimation.valueFrom] if a
        relative negative [adw.spring_animation.SpringAnimation.initialVelocity] is set.
  */
  @property bool clamp() nothrow
  {
    return getClamp();
  }

  /**
      Set `clamp` property.
      Params:
        propval = Whether the animation should be clamped.
          
          If set to `TRUE`, the animation will abruptly end as soon as it reaches the
          final value, preventing overshooting.
          
          It won't prevent overshooting [adw.spring_animation.SpringAnimation.valueFrom] if a
          relative negative [adw.spring_animation.SpringAnimation.initialVelocity] is set.
  */
  @property void clamp(bool propval) nothrow
  {
    setClamp(propval);
  }

  /**
      Get `epsilon` property.
      Returns: Precision of the spring.
        
        The level of precision used to determine when the animation has come to a
        rest, that is, when the amplitude of the oscillations becomes smaller than
        this value.
        
        If the epsilon value is too small, the animation will take a long time to
        stop after the animated value has stopped visibly changing.
        
        If the epsilon value is too large, the animation will end prematurely.
        
        The default value is 0.001.
  */
  @property double epsilon() nothrow
  {
    return getEpsilon();
  }

  /**
      Set `epsilon` property.
      Params:
        propval = Precision of the spring.
          
          The level of precision used to determine when the animation has come to a
          rest, that is, when the amplitude of the oscillations becomes smaller than
          this value.
          
          If the epsilon value is too small, the animation will take a long time to
          stop after the animated value has stopped visibly changing.
          
          If the epsilon value is too large, the animation will end prematurely.
          
          The default value is 0.001.
  */
  @property void epsilon(double propval) nothrow
  {
    setEpsilon(propval);
  }

  /**
      Get `estimatedDuration` property.
      Returns: Estimated duration of the animation, in milliseconds.
        
        Can be [adw.types.DURATION_INFINITE] if the spring damping is set to 0.
  */
  @property uint estimatedDuration() nothrow
  {
    return getEstimatedDuration();
  }

  /**
      Get `initialVelocity` property.
      Returns: The initial velocity to start the animation with.
        
        Initial velocity affects only the animation curve, but not its duration.
  */
  @property double initialVelocity() nothrow
  {
    return getInitialVelocity();
  }

  /**
      Set `initialVelocity` property.
      Params:
        propval = The initial velocity to start the animation with.
          
          Initial velocity affects only the animation curve, but not its duration.
  */
  @property void initialVelocity(double propval) nothrow
  {
    setInitialVelocity(propval);
  }

  /**
      Get `springParams` property.
      Returns: Physical parameters describing the spring.
  */
  @property adw.spring_params.SpringParams springParams() nothrow
  {
    return getSpringParams();
  }

  /**
      Set `springParams` property.
      Params:
        propval = Physical parameters describing the spring.
  */
  @property void springParams(adw.spring_params.SpringParams propval) nothrow
  {
    setSpringParams(propval);
  }

  /**
      Get `valueFrom` property.
      Returns: The value to animate from.
        
        The animation will start at this value and end at
        [adw.spring_animation.SpringAnimation.valueTo].
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
          [adw.spring_animation.SpringAnimation.valueTo].
  */
  @property void valueFrom(double propval) nothrow
  {
    setValueFrom(propval);
  }

  /**
      Get `valueTo` property.
      Returns: The value to animate to.
        
        The animation will start at [adw.spring_animation.SpringAnimation.valueFrom] and end
        at this value.
  */
  @property double valueTo() nothrow
  {
    return getValueTo();
  }

  /**
      Set `valueTo` property.
      Params:
        propval = The value to animate to.
          
          The animation will start at [adw.spring_animation.SpringAnimation.valueFrom] and end
          at this value.
  */
  @property void valueTo(double propval) nothrow
  {
    setValueTo(propval);
  }

  /**
      Get `velocity` property.
      Returns: Current velocity of the animation.
  */
  @property double velocity() nothrow
  {
    return getVelocity();
  }

  /**
      Creates a new [adw.spring_animation.SpringAnimation] on widget.
      
      The animation will animate target from from to to with the dynamics of a
      spring described by spring_params.
  
      Params:
        widget = a widget to create animation on
        from = a value to animate from
        to = a value to animate to
        springParams = physical parameters of the spring
        target = a target value to animate
      Returns: the newly created animation
  */
  this(gtk.widget.Widget widget, double from, double to, adw.spring_params.SpringParams springParams, adw.animation_target.AnimationTarget target) nothrow
  {
    AdwAnimation* _cretval;
    _cretval = adw_spring_animation_new(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, from, to, springParams ? cast(AdwSpringParams*)springParams._cPtr(Yes.Dup) : null, target ? cast(AdwAnimationTarget*)target._cPtr(Yes.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Calculates the value self will have at time.
      
      The time starts at 0 and ends at
      `propertySpringAnimation:estimated_duration`.
      
      See also [adw.spring_animation.SpringAnimation.calculateVelocity].
  
      Params:
        time = elapsed time, in milliseconds
      Returns: the value at time
  */
  double calculateValue(uint time) nothrow
  {
    double _retval;
    _retval = adw_spring_animation_calculate_value(cast(AdwSpringAnimation*)this._cPtr, time);
    return _retval;
  }

  /**
      Calculates the velocity self will have at time.
      
      The time starts at 0 and ends at
      `propertySpringAnimation:estimated_duration`.
      
      See also [adw.spring_animation.SpringAnimation.calculateValue].
  
      Params:
        time = elapsed time, in milliseconds
      Returns: the velocity at time
  */
  double calculateVelocity(uint time) nothrow
  {
    double _retval;
    _retval = adw_spring_animation_calculate_velocity(cast(AdwSpringAnimation*)this._cPtr, time);
    return _retval;
  }

  /**
      Gets whether self should be clamped.
      Returns: whether self is clamped
  */
  bool getClamp() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_spring_animation_get_clamp(cast(AdwSpringAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Gets the precision of the spring.
      Returns: the epsilon value
  */
  double getEpsilon() nothrow
  {
    double _retval;
    _retval = adw_spring_animation_get_epsilon(cast(AdwSpringAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Gets the estimated duration of self, in milliseconds.
      
      Can be [adw.types.DURATION_INFINITE] if the spring damping is set to 0.
      Returns: the estimated duration
  */
  uint getEstimatedDuration() nothrow
  {
    uint _retval;
    _retval = adw_spring_animation_get_estimated_duration(cast(AdwSpringAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Gets the initial velocity of self.
      Returns: the initial velocity
  */
  double getInitialVelocity() nothrow
  {
    double _retval;
    _retval = adw_spring_animation_get_initial_velocity(cast(AdwSpringAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Gets the physical parameters of the spring of self.
      Returns: the spring parameters
  */
  adw.spring_params.SpringParams getSpringParams() nothrow
  {
    AdwSpringParams* _cretval;
    _cretval = adw_spring_animation_get_spring_params(cast(AdwSpringAnimation*)this._cPtr);
    auto _retval = _cretval ? new adw.spring_params.SpringParams(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the value self will animate from.
      Returns: the value to animate from
  */
  double getValueFrom() nothrow
  {
    double _retval;
    _retval = adw_spring_animation_get_value_from(cast(AdwSpringAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value self will animate to.
      Returns: the value to animate to
  */
  double getValueTo() nothrow
  {
    double _retval;
    _retval = adw_spring_animation_get_value_to(cast(AdwSpringAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current velocity of self.
      Returns: the current velocity
  */
  double getVelocity() nothrow
  {
    double _retval;
    _retval = adw_spring_animation_get_velocity(cast(AdwSpringAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether self should be clamped.
      
      If set to `TRUE`, the animation will abruptly end as soon as it reaches the
      final value, preventing overshooting.
      
      It won't prevent overshooting [adw.spring_animation.SpringAnimation.valueFrom] if a
      relative negative [adw.spring_animation.SpringAnimation.initialVelocity] is set.
  
      Params:
        clamp = the new value
  */
  void setClamp(bool clamp) nothrow
  {
    adw_spring_animation_set_clamp(cast(AdwSpringAnimation*)this._cPtr, clamp);
  }

  /**
      Sets the precision of the spring.
      
      The level of precision used to determine when the animation has come to a
      rest, that is, when the amplitude of the oscillations becomes smaller than
      this value.
      
      If the epsilon value is too small, the animation will take a long time to
      stop after the animated value has stopped visibly changing.
      
      If the epsilon value is too large, the animation will end prematurely.
      
      The default value is 0.001.
  
      Params:
        epsilon = the new value
  */
  void setEpsilon(double epsilon) nothrow
  {
    adw_spring_animation_set_epsilon(cast(AdwSpringAnimation*)this._cPtr, epsilon);
  }

  /**
      Sets the initial velocity of self.
      
      Initial velocity affects only the animation curve, but not its duration.
  
      Params:
        velocity = the initial velocity
  */
  void setInitialVelocity(double velocity) nothrow
  {
    adw_spring_animation_set_initial_velocity(cast(AdwSpringAnimation*)this._cPtr, velocity);
  }

  /**
      Sets the physical parameters of the spring of self.
  
      Params:
        springParams = the new spring parameters
  */
  void setSpringParams(adw.spring_params.SpringParams springParams) nothrow
  {
    adw_spring_animation_set_spring_params(cast(AdwSpringAnimation*)this._cPtr, springParams ? cast(AdwSpringParams*)springParams._cPtr(No.Dup) : null);
  }

  /**
      Sets the value self will animate from.
      
      The animation will start at this value and end at
      [adw.spring_animation.SpringAnimation.valueTo].
  
      Params:
        value = the value to animate from
  */
  void setValueFrom(double value) nothrow
  {
    adw_spring_animation_set_value_from(cast(AdwSpringAnimation*)this._cPtr, value);
  }

  /**
      Sets the value self will animate to.
      
      The animation will start at [adw.spring_animation.SpringAnimation.valueFrom] and end at
      this value.
  
      Params:
        value = the value to animate to
  */
  void setValueTo(double value) nothrow
  {
    adw_spring_animation_set_value_to(cast(AdwSpringAnimation*)this._cPtr, value);
  }
}

/// Fluent builder implementation template for [adw.spring_animation.SpringAnimation]
class SpringAnimationGidBuilderImpl(T) : adw.animation.AnimationGidBuilderImpl!T
{

  /**
      Set `clamp` property.
      Params:
        propval = Whether the animation should be clamped.
          
          If set to `TRUE`, the animation will abruptly end as soon as it reaches the
          final value, preventing overshooting.
          
          It won't prevent overshooting [adw.spring_animation.SpringAnimation.valueFrom] if a
          relative negative [adw.spring_animation.SpringAnimation.initialVelocity] is set.
      Returns: Builder instance for fluent chaining
  */
  T clamp(bool propval) nothrow
  {
    return setProperty("clamp", propval);
  }

  /**
      Set `epsilon` property.
      Params:
        propval = Precision of the spring.
          
          The level of precision used to determine when the animation has come to a
          rest, that is, when the amplitude of the oscillations becomes smaller than
          this value.
          
          If the epsilon value is too small, the animation will take a long time to
          stop after the animated value has stopped visibly changing.
          
          If the epsilon value is too large, the animation will end prematurely.
          
          The default value is 0.001.
      Returns: Builder instance for fluent chaining
  */
  T epsilon(double propval) nothrow
  {
    return setProperty("epsilon", propval);
  }

  /**
      Set `initialVelocity` property.
      Params:
        propval = The initial velocity to start the animation with.
          
          Initial velocity affects only the animation curve, but not its duration.
      Returns: Builder instance for fluent chaining
  */
  T initialVelocity(double propval) nothrow
  {
    return setProperty("initial-velocity", propval);
  }

  /**
      Set `springParams` property.
      Params:
        propval = Physical parameters describing the spring.
      Returns: Builder instance for fluent chaining
  */
  T springParams(adw.spring_params.SpringParams propval) nothrow
  {
    return setProperty("spring-params", propval);
  }

  /**
      Set `valueFrom` property.
      Params:
        propval = The value to animate from.
          
          The animation will start at this value and end at
          [adw.spring_animation.SpringAnimation.valueTo].
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
          
          The animation will start at [adw.spring_animation.SpringAnimation.valueFrom] and end
          at this value.
      Returns: Builder instance for fluent chaining
  */
  T valueTo(double propval) nothrow
  {
    return setProperty("value-to", propval);
  }
}

/// Fluent builder for [adw.spring_animation.SpringAnimation]
final class SpringAnimationGidBuilder : SpringAnimationGidBuilderImpl!SpringAnimationGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SpringAnimation build() nothrow
  {
    return new SpringAnimation(cast(void*)createGObject(SpringAnimation._getGType), No.Take);
  }
}
