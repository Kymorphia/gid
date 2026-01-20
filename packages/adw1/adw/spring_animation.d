/// Module for [SpringAnimation] class
module adw.spring_animation;

import adw.animation;
import adw.animation_target;
import adw.c.functions;
import adw.c.types;
import adw.spring_params;
import adw.types;
import gid.gid;
import gtk.widget;

/**
    A spring-based `class@Animation`.
    
    [adw.spring_animation.SpringAnimation] implements an animation driven by a physical model of a
    spring described by `struct@SpringParams`, with a resting position in
    `property@SpringAnimation:value-to`, stretched to
    `property@SpringAnimation:value-from`.
    
    Since the animation is physically simulated, spring animations don't have a
    fixed duration. The animation will stop when the simulated spring comes to a
    rest - when the amplitude of the oscillations becomes smaller than
    `property@SpringAnimation:epsilon`, or immediately when it reaches
    `property@SpringAnimation:value-to` if
    `property@SpringAnimation:clamp` is set to `TRUE`. The estimated duration can
    be obtained with `property@SpringAnimation:estimated-duration`.
    
    Due to the nature of spring-driven motion the animation can overshoot
    `property@SpringAnimation:value-to` before coming to a rest. Whether the
    animation will overshoot or not depends on the damping ratio of the spring.
    See `struct@SpringParams` for more information about specific damping ratio
    values.
    
    If `property@SpringAnimation:clamp` is `TRUE`, the animation will abruptly
    end as soon as it reaches the final value, preventing overshooting.
    
    Animations can have an initial velocity value, set via
    `property@SpringAnimation:initial-velocity`, which adjusts the curve without
    changing the duration. This makes spring animations useful for deceleration
    at the end of gestures.
    
    If the initial and final values are equal, and the initial velocity is not 0,
    the animation value will bounce and return to its resting position.
*/
class SpringAnimation : adw.animation.Animation
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
    return cast(void function())adw_spring_animation_get_type != &gidSymbolNotFound ? adw_spring_animation_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SpringAnimation self()
  {
    return this;
  }

  /**
      Get `clamp` property.
      Returns: Whether the animation should be clamped.
        
        If set to `TRUE`, the animation will abruptly end as soon as it reaches the
        final value, preventing overshooting.
        
        It won't prevent overshooting `property@SpringAnimation:value-from` if a
        relative negative `property@SpringAnimation:initial-velocity` is set.
  */
  @property bool clamp()
  {
    return getClamp();
  }

  /**
      Set `clamp` property.
      Params:
        propval = Whether the animation should be clamped.
          
          If set to `TRUE`, the animation will abruptly end as soon as it reaches the
          final value, preventing overshooting.
          
          It won't prevent overshooting `property@SpringAnimation:value-from` if a
          relative negative `property@SpringAnimation:initial-velocity` is set.
  */
  @property void clamp(bool propval)
  {
    return setClamp(propval);
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
  @property double epsilon()
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
  @property void epsilon(double propval)
  {
    return setEpsilon(propval);
  }

  /**
      Get `estimatedDuration` property.
      Returns: Estimated duration of the animation, in milliseconds.
        
        Can be `const@DURATION_INFINITE` if the spring damping is set to 0.
  */
  @property uint estimatedDuration()
  {
    return getEstimatedDuration();
  }

  /**
      Get `initialVelocity` property.
      Returns: The initial velocity to start the animation with.
        
        Initial velocity affects only the animation curve, but not its duration.
  */
  @property double initialVelocity()
  {
    return getInitialVelocity();
  }

  /**
      Set `initialVelocity` property.
      Params:
        propval = The initial velocity to start the animation with.
          
          Initial velocity affects only the animation curve, but not its duration.
  */
  @property void initialVelocity(double propval)
  {
    return setInitialVelocity(propval);
  }

  /**
      Get `springParams` property.
      Returns: Physical parameters describing the spring.
  */
  @property adw.spring_params.SpringParams springParams()
  {
    return getSpringParams();
  }

  /**
      Set `springParams` property.
      Params:
        propval = Physical parameters describing the spring.
  */
  @property void springParams(adw.spring_params.SpringParams propval)
  {
    return setSpringParams(propval);
  }

  /**
      Get `valueFrom` property.
      Returns: The value to animate from.
        
        The animation will start at this value and end at
        `property@SpringAnimation:value-to`.
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
          `property@SpringAnimation:value-to`.
  */
  @property void valueFrom(double propval)
  {
    return setValueFrom(propval);
  }

  /**
      Get `valueTo` property.
      Returns: The value to animate to.
        
        The animation will start at `property@SpringAnimation:value-from` and end
        at this value.
  */
  @property double valueTo()
  {
    return getValueTo();
  }

  /**
      Set `valueTo` property.
      Params:
        propval = The value to animate to.
          
          The animation will start at `property@SpringAnimation:value-from` and end
          at this value.
  */
  @property void valueTo(double propval)
  {
    return setValueTo(propval);
  }

  /**
      Get `velocity` property.
      Returns: Current velocity of the animation.
  */
  @property double velocity()
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
  this(gtk.widget.Widget widget, double from, double to, adw.spring_params.SpringParams springParams, adw.animation_target.AnimationTarget target)
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
  double calculateValue(uint time)
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
  double calculateVelocity(uint time)
  {
    double _retval;
    _retval = adw_spring_animation_calculate_velocity(cast(AdwSpringAnimation*)this._cPtr, time);
    return _retval;
  }

  /**
      Gets whether self should be clamped.
      Returns: whether self is clamped
  */
  bool getClamp()
  {
    bool _retval;
    _retval = cast(bool)adw_spring_animation_get_clamp(cast(AdwSpringAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Gets the precision of the spring.
      Returns: the epsilon value
  */
  double getEpsilon()
  {
    double _retval;
    _retval = adw_spring_animation_get_epsilon(cast(AdwSpringAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Gets the estimated duration of self, in milliseconds.
      
      Can be `constDURATION_INFINITE` if the spring damping is set to 0.
      Returns: the estimated duration
  */
  uint getEstimatedDuration()
  {
    uint _retval;
    _retval = adw_spring_animation_get_estimated_duration(cast(AdwSpringAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Gets the initial velocity of self.
      Returns: the initial velocity
  */
  double getInitialVelocity()
  {
    double _retval;
    _retval = adw_spring_animation_get_initial_velocity(cast(AdwSpringAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Gets the physical parameters of the spring of self.
      Returns: the spring parameters
  */
  adw.spring_params.SpringParams getSpringParams()
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
  double getValueFrom()
  {
    double _retval;
    _retval = adw_spring_animation_get_value_from(cast(AdwSpringAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value self will animate to.
      Returns: the value to animate to
  */
  double getValueTo()
  {
    double _retval;
    _retval = adw_spring_animation_get_value_to(cast(AdwSpringAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current velocity of self.
      Returns: the current velocity
  */
  double getVelocity()
  {
    double _retval;
    _retval = adw_spring_animation_get_velocity(cast(AdwSpringAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether self should be clamped.
      
      If set to `TRUE`, the animation will abruptly end as soon as it reaches the
      final value, preventing overshooting.
      
      It won't prevent overshooting `propertySpringAnimation:value-from` if a
      relative negative `propertySpringAnimation:initial-velocity` is set.
  
      Params:
        clamp = the new value
  */
  void setClamp(bool clamp)
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
  void setEpsilon(double epsilon)
  {
    adw_spring_animation_set_epsilon(cast(AdwSpringAnimation*)this._cPtr, epsilon);
  }

  /**
      Sets the initial velocity of self.
      
      Initial velocity affects only the animation curve, but not its duration.
  
      Params:
        velocity = the initial velocity
  */
  void setInitialVelocity(double velocity)
  {
    adw_spring_animation_set_initial_velocity(cast(AdwSpringAnimation*)this._cPtr, velocity);
  }

  /**
      Sets the physical parameters of the spring of self.
  
      Params:
        springParams = the new spring parameters
  */
  void setSpringParams(adw.spring_params.SpringParams springParams)
  {
    adw_spring_animation_set_spring_params(cast(AdwSpringAnimation*)this._cPtr, springParams ? cast(AdwSpringParams*)springParams._cPtr(No.Dup) : null);
  }

  /**
      Sets the value self will animate from.
      
      The animation will start at this value and end at
      `propertySpringAnimation:value-to`.
  
      Params:
        value = the value to animate from
  */
  void setValueFrom(double value)
  {
    adw_spring_animation_set_value_from(cast(AdwSpringAnimation*)this._cPtr, value);
  }

  /**
      Sets the value self will animate to.
      
      The animation will start at `propertySpringAnimation:value-from` and end at
      this value.
  
      Params:
        value = the value to animate to
  */
  void setValueTo(double value)
  {
    adw_spring_animation_set_value_to(cast(AdwSpringAnimation*)this._cPtr, value);
  }
}
