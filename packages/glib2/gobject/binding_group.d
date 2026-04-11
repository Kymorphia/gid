/// Module for [BindingGroup] class
module gobject.binding_group;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.closure;
import gobject.gid_builder;
import gobject.object;
import gobject.types;

/**
    [gobject.binding_group.BindingGroup] can be used to bind multiple properties
    from an object collectively.
    
    Use the various methods to bind properties from a single source
    object to multiple destination objects. Properties can be bound
    bidirectionally and are connected when the source object is set
    with [gobject.binding_group.BindingGroup.setSource].
*/
class BindingGroup : gobject.object.ObjectWrap
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
    return cast(void function())g_binding_group_get_type != &gidSymbolNotFound ? g_binding_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BindingGroup self()
  {
    return this;
  }

  /**
      Get builder for [gobject.binding_group.BindingGroup]
      Returns: New builder object
  */
  static BindingGroupGidBuilder builder()
  {
    return new BindingGroupGidBuilder;
  }

  /**
      Get `source` property.
      Returns: The source object used for binding properties.
  */
  @property gobject.object.ObjectWrap source()
  {
    return gobject.object.ObjectWrap.getProperty!(gobject.object.ObjectWrap)("source");
  }

  /**
      Set `source` property.
      Params:
        propval = The source object used for binding properties.
  */
  @property void source(gobject.object.ObjectWrap propval)
  {
    setSource(propval);
  }

  /**
      Creates a new #GBindingGroup.
      Returns: a new #GBindingGroup
  */
  this()
  {
    GBindingGroup* _cretval;
    _cretval = g_binding_group_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a binding between source_property on the source object
      and target_property on target. Whenever the source_property
      is changed the target_property is updated using the same value.
      The binding flag [gobject.types.BindingFlags.SyncCreate] is automatically specified.
      
      See [gobject.object.ObjectWrap.bindProperty] for more information.
  
      Params:
        sourceProperty = the property on the source to bind
        target = the target #GObject
        targetProperty = the property on target to bind
        flags = the flags used to create the #GBinding
  */
  void bind(string sourceProperty, gobject.object.ObjectWrap target, string targetProperty, gobject.types.BindingFlags flags)
  {
    const(char)* _sourceProperty = sourceProperty.toCString(No.Alloc);
    const(char)* _targetProperty = targetProperty.toCString(No.Alloc);
    g_binding_group_bind(cast(GBindingGroup*)this._cPtr, _sourceProperty, target ? cast(GObject*)target._cPtr(No.Dup) : null, _targetProperty, flags);
  }

  /**
      Creates a binding between source_property on the source object and
      target_property on target, allowing you to set the transformation
      functions to be used by the binding. The binding flag
      [gobject.types.BindingFlags.SyncCreate] is automatically specified.
      
      This function is the language bindings friendly version of
      g_binding_group_bind_property_full(), using #GClosures
      instead of function pointers.
      
      See [gobject.object.ObjectWrap.bindPropertyWithClosures] for more information.
  
      Params:
        sourceProperty = the property on the source to bind
        target = the target #GObject
        targetProperty = the property on target to bind
        flags = the flags used to create the #GBinding
        transformTo = a #GClosure wrapping the
              transformation function from the source object to the target,
              or null to use the default
        transformFrom = a #GClosure wrapping the
              transformation function from the target to the source object,
              or null to use the default
  */
  void bindFull(string sourceProperty, gobject.object.ObjectWrap target, string targetProperty, gobject.types.BindingFlags flags, gobject.closure.Closure transformTo = null, gobject.closure.Closure transformFrom = null)
  {
    const(char)* _sourceProperty = sourceProperty.toCString(No.Alloc);
    const(char)* _targetProperty = targetProperty.toCString(No.Alloc);
    g_binding_group_bind_with_closures(cast(GBindingGroup*)this._cPtr, _sourceProperty, target ? cast(GObject*)target._cPtr(No.Dup) : null, _targetProperty, flags, transformTo ? cast(GClosure*)transformTo._cPtr(No.Dup) : null, transformFrom ? cast(GClosure*)transformFrom._cPtr(No.Dup) : null);
  }

  /**
      Gets the source object used for binding properties.
      Returns: a #GObject or null.
  */
  gobject.object.ObjectWrap dupSource()
  {
    GObject* _cretval;
    _cretval = g_binding_group_dup_source(cast(GBindingGroup*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets source as the source object used for creating property
      bindings. If there is already a source object all bindings from it
      will be removed.
      
      Note that all properties that have been bound must exist on source.
  
      Params:
        source = the source #GObject,
            or null to clear it
  */
  void setSource(gobject.object.ObjectWrap source = null)
  {
    g_binding_group_set_source(cast(GBindingGroup*)this._cPtr, source ? cast(GObject*)source._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gobject.binding_group.BindingGroup]
class BindingGroupGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `source` property.
      Params:
        propval = The source object used for binding properties.
      Returns: Builder instance for fluent chaining
  */
  T source(gobject.object.ObjectWrap propval)
  {
    return setProperty("source", propval);
  }
}

/// Fluent builder for [gobject.binding_group.BindingGroup]
final class BindingGroupGidBuilder : BindingGroupGidBuilderImpl!BindingGroupGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BindingGroup build()
  {
    return new BindingGroup(cast(void*)createGObject(BindingGroup._getGType), Yes.Take);
  }
}
