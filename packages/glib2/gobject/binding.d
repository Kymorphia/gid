/// Module for [Binding] class
module gobject.binding;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.gid_builder;
import gobject.object;
import gobject.types;

/**
    [gobject.object.ObjectWrap] instance (or source) and another property on another [gobject.object.ObjectWrap]
    instance (or target).
    
    Whenever the source property changes, the same value is applied to the
    target property; for instance, the following binding:
    
    ```c
      g_object_bind_property (object1, "property-a",
                              object2, "property-b",
                              G_BINDING_DEFAULT);
    ```
    
    will cause the property named "property-b" of @object2 to be updated
    every time `method@GObject.set` or the specific accessor changes the value of
    the property "property-a" of @object1.
    
    It is possible to create a bidirectional binding between two properties
    of two [gobject.object.ObjectWrap] instances, so that if either property changes, the
    other is updated as well, for instance:
    
    ```c
      g_object_bind_property (object1, "property-a",
                              object2, "property-b",
                              G_BINDING_BIDIRECTIONAL);
    ```
    
    will keep the two properties in sync.
    
    It is also possible to set a custom transformation function (in both
    directions, in case of a bidirectional binding) to apply a custom
    transformation from the source value to the target value before
    applying it; for instance, the following binding:
    
    ```c
      g_object_bind_property_full (adjustment1, "value",
                                   adjustment2, "value",
                                   G_BINDING_BIDIRECTIONAL,
                                   celsius_to_fahrenheit,
                                   fahrenheit_to_celsius,
                                   NULL, NULL);
    ```
    
    will keep the "value" property of the two adjustments in sync; the
    @celsius_to_fahrenheit function will be called whenever the "value"
    property of @adjustment1 changes and will transform the current value
    of the property before applying it to the "value" property of @adjustment2.
    
    Vice versa, the @fahrenheit_to_celsius function will be called whenever
    the "value" property of @adjustment2 changes, and will transform the
    current value of the property before applying it to the "value" property
    of @adjustment1.
    
    Note that #GBinding does not resolve cycles by itself; a cycle like
    
    ```
      object1:propertyA -> object2:propertyB
      object2:propertyB -> object3:propertyC
      object3:propertyC -> object1:propertyA
    ```
    
    might lead to an infinite loop. The loop, in this particular case,
    can be avoided if the objects emit the `GObject::notify` signal only
    if the value has effectively been changed. A binding is implemented
    using the `GObject::notify` signal, so it is susceptible to all the
    various ways of blocking a signal emission, like `func@GObject.signal_stop_emission`
    or `func@GObject.signal_handler_block`.
    
    A binding will be severed, and the resources it allocates freed, whenever
    either one of the [gobject.object.ObjectWrap] instances it refers to are finalized, or when
    the #GBinding instance loses its last reference.
    
    Bindings for languages with garbage collection can use
    [gobject.binding.Binding.unbind] to explicitly release a binding between the source
    and target properties, instead of relying on the last reference on the
    binding, source, and target instances to drop.
*/
class Binding : gobject.object.ObjectWrap
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
    return cast(void function())g_binding_get_type != &gidSymbolNotFound ? g_binding_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Binding self()
  {
    return this;
  }

  /**
  Get builder for [gobject.binding.Binding]
  Returns: New builder object
  */
  static BindingGidBuilder builder()
  {
    return new BindingGidBuilder;
  }

  /**
      Get `flags` property.
      Returns: Flags to be used to control the #GBinding
  */
  @property gobject.types.BindingFlags flags()
  {
    return getFlags();
  }

  /**
      Get `source` property.
      Returns: The #GObject that should be used as the source of the binding
  */
  @property gobject.object.ObjectWrap source()
  {
    return getSource();
  }

  /**
      Get `sourceProperty` property.
      Returns: The name of the property of #GBinding:source that should be used
        as the source of the binding.
        
        This should be in [canonical form][canonical-parameter-names] to get the
        best performance.
  */
  @property string sourceProperty()
  {
    return getSourceProperty();
  }

  /**
      Get `target` property.
      Returns: The #GObject that should be used as the target of the binding
  */
  @property gobject.object.ObjectWrap target()
  {
    return getTarget();
  }

  /**
      Get `targetProperty` property.
      Returns: The name of the property of #GBinding:target that should be used
        as the target of the binding.
        
        This should be in [canonical form][canonical-parameter-names] to get the
        best performance.
  */
  @property string targetProperty()
  {
    return getTargetProperty();
  }

  /**
      Retrieves the #GObject instance used as the source of the binding.
      
      A #GBinding can outlive the source #GObject as the binding does not hold a
      strong reference to the source. If the source is destroyed before the
      binding then this function will return null.
      Returns: the source #GObject, or null if the
            source does not exist any more.
  */
  gobject.object.ObjectWrap dupSource()
  {
    GObject* _cretval;
    _cretval = g_binding_dup_source(cast(GBinding*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Retrieves the #GObject instance used as the target of the binding.
      
      A #GBinding can outlive the target #GObject as the binding does not hold a
      strong reference to the target. If the target is destroyed before the
      binding then this function will return null.
      Returns: the target #GObject, or null if the
            target does not exist any more.
  */
  gobject.object.ObjectWrap dupTarget()
  {
    GObject* _cretval;
    _cretval = g_binding_dup_target(cast(GBinding*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Retrieves the flags passed when constructing the #GBinding.
      Returns: the #GBindingFlags used by the #GBinding
  */
  gobject.types.BindingFlags getFlags()
  {
    GBindingFlags _cretval;
    _cretval = g_binding_get_flags(cast(GBinding*)this._cPtr);
    gobject.types.BindingFlags _retval = cast(gobject.types.BindingFlags)_cretval;
    return _retval;
  }

  /**
      Retrieves the #GObject instance used as the source of the binding.
      
      A #GBinding can outlive the source #GObject as the binding does not hold a
      strong reference to the source. If the source is destroyed before the
      binding then this function will return null.
      
      Use [gobject.binding.Binding.dupSource] if the source or binding are used from different
      threads as otherwise the pointer returned from this function might become
      invalid if the source is finalized from another thread in the meantime.
      Returns: the source #GObject, or null if the
            source does not exist any more.
  
      Deprecated: Use [gobject.binding.Binding.dupSource] for a safer version of this
        function.
  */
  gobject.object.ObjectWrap getSource()
  {
    GObject* _cretval;
    _cretval = g_binding_get_source(cast(GBinding*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the name of the property of #GBinding:source used as the source
      of the binding.
      Returns: the name of the source property
  */
  string getSourceProperty()
  {
    const(char)* _cretval;
    _cretval = g_binding_get_source_property(cast(GBinding*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves the #GObject instance used as the target of the binding.
      
      A #GBinding can outlive the target #GObject as the binding does not hold a
      strong reference to the target. If the target is destroyed before the
      binding then this function will return null.
      
      Use [gobject.binding.Binding.dupTarget] if the target or binding are used from different
      threads as otherwise the pointer returned from this function might become
      invalid if the target is finalized from another thread in the meantime.
      Returns: the target #GObject, or null if the
            target does not exist any more.
  
      Deprecated: Use [gobject.binding.Binding.dupTarget] for a safer version of this
        function.
  */
  gobject.object.ObjectWrap getTarget()
  {
    GObject* _cretval;
    _cretval = g_binding_get_target(cast(GBinding*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the name of the property of #GBinding:target used as the target
      of the binding.
      Returns: the name of the target property
  */
  string getTargetProperty()
  {
    const(char)* _cretval;
    _cretval = g_binding_get_target_property(cast(GBinding*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Explicitly releases the binding between the source and the target
      property expressed by binding.
      
      This function will release the reference that is being held on
      the binding instance if the binding is still bound; if you want to hold on
      to the #GBinding instance after calling [gobject.binding.Binding.unbind], you will need
      to hold a reference to it.
      
      Note however that this function does not take ownership of binding, it
      only unrefs the reference that was initially created by
      [gobject.object.ObjectWrap.bindProperty] and is owned by the binding.
  */
  void unbind()
  {
    g_binding_unbind(cast(GBinding*)this._cPtr);
  }
}

class BindingGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `flags` property.
      Params:
        propval = Flags to be used to control the #GBinding
      Returns: Builder instance for fluent chaining
  */
  T flags(gobject.types.BindingFlags propval)
  {
    return setProperty("flags", propval);
  }

  /**
      Set `source` property.
      Params:
        propval = The #GObject that should be used as the source of the binding
      Returns: Builder instance for fluent chaining
  */
  T source(gobject.object.ObjectWrap propval)
  {
    return setProperty("source", propval);
  }

  /**
      Set `sourceProperty` property.
      Params:
        propval = The name of the property of #GBinding:source that should be used
          as the source of the binding.
          
          This should be in [canonical form][canonical-parameter-names] to get the
          best performance.
      Returns: Builder instance for fluent chaining
  */
  T sourceProperty(string propval)
  {
    return setProperty("source-property", propval);
  }

  /**
      Set `target` property.
      Params:
        propval = The #GObject that should be used as the target of the binding
      Returns: Builder instance for fluent chaining
  */
  T target(gobject.object.ObjectWrap propval)
  {
    return setProperty("target", propval);
  }

  /**
      Set `targetProperty` property.
      Params:
        propval = The name of the property of #GBinding:target that should be used
          as the target of the binding.
          
          This should be in [canonical form][canonical-parameter-names] to get the
          best performance.
      Returns: Builder instance for fluent chaining
  */
  T targetProperty(string propval)
  {
    return setProperty("target-property", propval);
  }
}

/// Fluent builder for [gobject.binding.Binding]
final class BindingGidBuilder : BindingGidBuilderImpl!BindingGidBuilder
{
  Binding build()
  {
    return new Binding(cast(void*)createGObject(Binding._getGType), No.Take);
  }
}
