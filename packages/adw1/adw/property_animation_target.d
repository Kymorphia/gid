/// Module for [PropertyAnimationTarget] class
module adw.property_animation_target;

import adw.animation_target;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gobject.param_spec;

/**
    An `class@AnimationTarget` changing the value of a property of a
    [gobject.object.ObjectWrap] instance.
*/
class PropertyAnimationTarget : adw.animation_target.AnimationTarget
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
    return cast(void function())adw_property_animation_target_get_type != &gidSymbolNotFound ? adw_property_animation_target_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PropertyAnimationTarget self()
  {
    return this;
  }

  /**
  Get builder for [adw.property_animation_target.PropertyAnimationTarget]
  Returns: New builder object
  */
  static PropertyAnimationTargetGidBuilder builder()
  {
    return new PropertyAnimationTargetGidBuilder;
  }

  /**
      Get `object` property.
      Returns: The object whose property will be animated.
        
        The [adw.property_animation_target.PropertyAnimationTarget] instance does not hold a strong reference
        on the object; make sure the object is kept alive throughout the target's
        lifetime.
  */
  @property gobject.object.ObjectWrap object()
  {
    return getObject();
  }

  /**
      Get `pspec` property.
      Returns: The [gobject.param_spec.ParamSpec] of the property to be animated.
  */
  @property gobject.param_spec.ParamSpec pspec()
  {
    return getPspec();
  }

  /**
      Creates a new [adw.property_animation_target.PropertyAnimationTarget] for the property_name property on
      object.
  
      Params:
        object = an object to be animated
        propertyName = the name of the property on object to animate
      Returns: the newly created [adw.property_animation_target.PropertyAnimationTarget]
  */
  this(gobject.object.ObjectWrap object, string propertyName)
  {
    AdwAnimationTarget* _cretval;
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    _cretval = adw_property_animation_target_new(object ? cast(GObject*)object._cPtr(No.Dup) : null, _propertyName);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new [adw.property_animation_target.PropertyAnimationTarget] for the pspec property on
      object.
  
      Params:
        object = an object to be animated
        pspec = the param spec of the property on object to animate
      Returns: new newly created [adw.property_animation_target.PropertyAnimationTarget]
  */
  static adw.property_animation_target.PropertyAnimationTarget newForPspec(gobject.object.ObjectWrap object, gobject.param_spec.ParamSpec pspec)
  {
    AdwAnimationTarget* _cretval;
    _cretval = adw_property_animation_target_new_for_pspec(object ? cast(GObject*)object._cPtr(No.Dup) : null, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.property_animation_target.PropertyAnimationTarget)(cast(AdwAnimationTarget*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the object animated by self.
      
      The [adw.property_animation_target.PropertyAnimationTarget] instance does not hold a strong reference on
      the object; make sure the object is kept alive throughout the target's
      lifetime.
      Returns: the animated object
  */
  gobject.object.ObjectWrap getObject()
  {
    GObject* _cretval;
    _cretval = adw_property_animation_target_get_object(cast(AdwPropertyAnimationTarget*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the [gobject.param_spec.ParamSpec] of the property animated by self.
      Returns: the animated property's [gobject.param_spec.ParamSpec]
  */
  gobject.param_spec.ParamSpec getPspec()
  {
    GParamSpec* _cretval;
    _cretval = adw_property_animation_target_get_pspec(cast(AdwPropertyAnimationTarget*)this._cPtr);
    auto _retval = _cretval ? new gobject.param_spec.ParamSpec(cast(GParamSpec*)_cretval, No.Take) : null;
    return _retval;
  }
}

class PropertyAnimationTargetGidBuilderImpl(T) : adw.animation_target.AnimationTargetGidBuilderImpl!T
{

  /**
      Set `object` property.
      Params:
        propval = The object whose property will be animated.
          
          The [adw.property_animation_target.PropertyAnimationTarget] instance does not hold a strong reference
          on the object; make sure the object is kept alive throughout the target's
          lifetime.
      Returns: Builder instance for fluent chaining
  */
  T object(gobject.object.ObjectWrap propval)
  {
    return setProperty("object", propval);
  }

  /**
      Set `pspec` property.
      Params:
        propval = The [gobject.param_spec.ParamSpec] of the property to be animated.
      Returns: Builder instance for fluent chaining
  */
  T pspec(gobject.param_spec.ParamSpec propval)
  {
    return setProperty("pspec", propval);
  }
}

/// Fluent builder for [adw.property_animation_target.PropertyAnimationTarget]
final class PropertyAnimationTargetGidBuilder : PropertyAnimationTargetGidBuilderImpl!PropertyAnimationTargetGidBuilder
{
  PropertyAnimationTarget build()
  {
    return new PropertyAnimationTarget(cast(void*)createGObject(PropertyAnimationTarget._getGType), Yes.Take);
  }
}
