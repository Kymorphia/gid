/// Module for [PropertyAnimationTarget] class
module gid.adw1.property_animation_target;

public import gid.core.basictypes;
import gid.adw1.animation_target;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.param_spec;

/**
    An [gid.adw1.animation_target.AnimationTarget] changing the value of a property of a
    [gid.gobject2.object.ObjectWrap] instance.
*/
class PropertyAnimationTarget : gid.adw1.animation_target.AnimationTarget
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())adw_property_animation_target_get_type != &gidSymbolNotFound ? adw_property_animation_target_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwPropertyAnimationTarget";
  }

  /** Returns `this`, for use in `with` statements. */
  override PropertyAnimationTarget self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.property_animation_target.PropertyAnimationTarget]
      Returns: New builder object
  */
  static PropertyAnimationTargetGidBuilder builder() nothrow
  {
    return new PropertyAnimationTargetGidBuilder;
  }

  /**
      Get `object` property.
      Returns: The object whose property will be animated.
        
        The [gid.adw1.property_animation_target.PropertyAnimationTarget] instance does not hold a strong reference
        on the object; make sure the object is kept alive throughout the target's
        lifetime.
  */
  @property gid.gobject2.object.ObjectWrap object() nothrow
  {
    return getObject();
  }

  /**
      Get `pspec` property.
      Returns: The [gid.gobject2.param_spec.ParamSpec] of the property to be animated.
  */
  @property gid.gobject2.param_spec.ParamSpec pspec() nothrow
  {
    return getPspec();
  }

  /**
      Creates a new [gid.adw1.property_animation_target.PropertyAnimationTarget] for the property_name property on
      object.
  
      Params:
        object = an object to be animated
        propertyName = the name of the property on object to animate
      Returns: the newly created [gid.adw1.property_animation_target.PropertyAnimationTarget]
  */
  this(gid.gobject2.object.ObjectWrap object, string propertyName) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      AdwAnimationTarget* _cretval;
      const(char)* _propertyName = propertyName.toCString!(No.Malloc, No.Nullable);
      _cretval = adw_property_animation_target_new(object ? cast(GObject*)object._cPtr(No.Dup) : null, _propertyName);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Creates a new [gid.adw1.property_animation_target.PropertyAnimationTarget] for the pspec property on
      object.
  
      Params:
        object = an object to be animated
        pspec = the param spec of the property on object to animate
      Returns: new newly created [gid.adw1.property_animation_target.PropertyAnimationTarget]
  */
  static gid.adw1.property_animation_target.PropertyAnimationTarget newForPspec(gid.gobject2.object.ObjectWrap object, gid.gobject2.param_spec.ParamSpec pspec) nothrow
  {
    AdwAnimationTarget* _cretval;
    _cretval = adw_property_animation_target_new_for_pspec(object ? cast(GObject*)object._cPtr(No.Dup) : null, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.property_animation_target.PropertyAnimationTarget)(cast(AdwAnimationTarget*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the object animated by self.
      
      The [gid.adw1.property_animation_target.PropertyAnimationTarget] instance does not hold a strong reference on
      the object; make sure the object is kept alive throughout the target's
      lifetime.
      Returns: the animated object
  */
  gid.gobject2.object.ObjectWrap getObject() nothrow
  {
    GObject* _cretval;
    _cretval = adw_property_animation_target_get_object(cast(AdwPropertyAnimationTarget*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the [gid.gobject2.param_spec.ParamSpec] of the property animated by self.
      Returns: the animated property's [gid.gobject2.param_spec.ParamSpec]
  */
  gid.gobject2.param_spec.ParamSpec getPspec() nothrow
  {
    GParamSpec* _cretval;
    _cretval = adw_property_animation_target_get_pspec(cast(AdwPropertyAnimationTarget*)this._cPtr);
    auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, No.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.adw1.property_animation_target.PropertyAnimationTarget]
class PropertyAnimationTargetGidBuilderImpl(T) : gid.adw1.animation_target.AnimationTargetGidBuilderImpl!T
{

  /**
      Set `object` property.
      Params:
        propval = The object whose property will be animated.
          
          The [gid.adw1.property_animation_target.PropertyAnimationTarget] instance does not hold a strong reference
          on the object; make sure the object is kept alive throughout the target's
          lifetime.
      Returns: Builder instance for fluent chaining
  */
  T object(gid.gobject2.object.ObjectWrap propval) nothrow
  {
    return setProperty("object", propval);
  }

  /**
      Set `pspec` property.
      Params:
        propval = The [gid.gobject2.param_spec.ParamSpec] of the property to be animated.
      Returns: Builder instance for fluent chaining
  */
  T pspec(gid.gobject2.param_spec.ParamSpec propval) nothrow
  {
    return setProperty("pspec", propval);
  }
}

/// Fluent builder for [gid.adw1.property_animation_target.PropertyAnimationTarget]
final class PropertyAnimationTargetGidBuilder : PropertyAnimationTargetGidBuilderImpl!PropertyAnimationTargetGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PropertyAnimationTarget build() nothrow
  {
    return new PropertyAnimationTarget(cast(void*)createGObject(PropertyAnimationTarget._getGType), Yes.Take);
  }
}
