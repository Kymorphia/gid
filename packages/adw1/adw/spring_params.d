/// Module for [SpringParams] class
module adw.spring_params;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.boxed;

/**
    Physical parameters of a spring for `class@SpringAnimation`.
    
    Any spring can be described by three parameters: mass, stiffness and damping.
    
    An undamped spring will produce an oscillatory motion which will go on
    forever.
    
    The frequency and amplitude of the oscillations will be determined by the
    stiffness (how "strong" the spring is) and its mass (how much "inertia" it
    has).
    
    If damping is larger than 0, the amplitude of that oscillating motion will
    exponientally decrease over time. If that damping is strong enough that the
    spring can't complete a full oscillation, it's called an overdamped spring.
    
    If we the spring can oscillate, it's called an underdamped spring.
    
    The value between these two behaviors is called critical damping; a
    critically damped spring will comes to rest in the minimum possible time
    without producing oscillations.
    
    The damping can be replaced by damping ratio, which produces the following
    springs:
    
    $(LIST
      * 0: an undamped spring.
      * Between 0 and 1: an underdamped spring.
      * 1: a critically damped spring.
      * Larger than 1: an overdamped spring.
    )
      
    As such
*/
class SpringParams : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_spring_params_get_type != &gidSymbolNotFound ? adw_spring_params_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SpringParams self()
  {
    return this;
  }

  /**
      Creates a new [adw.spring_params.SpringParams] from mass, stiffness and damping_ratio.
      
      The damping value is calculated from damping_ratio and the other two
      parameters.
      
      $(LIST
        * If damping_ratio is 0, the spring will not be damped and will oscillate
          endlessly.
        * If damping_ratio is between 0 and 1, the spring is underdamped and will
          always overshoot.
        * If damping_ratio is 1, the spring is critically damped and will reach its
          resting position the quickest way possible.
        * If damping_ratio is larger than 1, the spring is overdamped and will reach
          its resting position faster than it can complete an oscillation.
      )
        
      [adw.spring_params.SpringParams.newFull] allows to pass a raw damping value instead.
  
      Params:
        dampingRatio = the damping ratio of the spring
        mass = the mass of the spring
        stiffness = the stiffness of the spring
      Returns: the newly created spring parameters
  */
  this(double dampingRatio, double mass, double stiffness)
  {
    AdwSpringParams* _cretval;
    _cretval = adw_spring_params_new(dampingRatio, mass, stiffness);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new [adw.spring_params.SpringParams] from mass, stiffness and damping.
      
      See [adw.spring_params.SpringParams.new_] for a simplified constructor using damping ratio
      instead of damping.
  
      Params:
        damping = the damping of the spring
        mass = the mass of the spring
        stiffness = the stiffness of the spring
      Returns: the newly created spring parameters
  */
  static adw.spring_params.SpringParams newFull(double damping, double mass, double stiffness)
  {
    AdwSpringParams* _cretval;
    _cretval = adw_spring_params_new_full(damping, mass, stiffness);
    auto _retval = _cretval ? new adw.spring_params.SpringParams(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the damping of self.
      Returns: the damping
  */
  double getDamping()
  {
    double _retval;
    _retval = adw_spring_params_get_damping(cast(AdwSpringParams*)this._cPtr);
    return _retval;
  }

  /**
      Gets the damping ratio of self.
      Returns: the damping ratio
  */
  double getDampingRatio()
  {
    double _retval;
    _retval = adw_spring_params_get_damping_ratio(cast(AdwSpringParams*)this._cPtr);
    return _retval;
  }

  /**
      Gets the mass of self.
      Returns: the mass
  */
  double getMass()
  {
    double _retval;
    _retval = adw_spring_params_get_mass(cast(AdwSpringParams*)this._cPtr);
    return _retval;
  }

  /**
      Gets the stiffness of self.
      Returns: the stiffness
  */
  double getStiffness()
  {
    double _retval;
    _retval = adw_spring_params_get_stiffness(cast(AdwSpringParams*)this._cPtr);
    return _retval;
  }
}
