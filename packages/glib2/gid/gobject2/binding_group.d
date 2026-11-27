/// Module for [BindingGroup] class
module gid.gobject2.binding_group;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;
import gid.gobject2.closure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;

/**
    [gid.gobject2.binding_group.BindingGroup] can be used to bind multiple properties
    from an object collectively.
    
    Use the various methods to bind properties from a single source
    object to multiple destination objects. Properties can be bound
    bidirectionally and are connected when the source object is set
    with [gid.gobject2.binding_group.BindingGroup.setSource].
*/
@gidGir("BindingGroup")
class BindingGroup : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_binding_group_get_type != &gidSymbolNotFound ? g_binding_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GBindingGroup";
  }

  /** Returns `this`, for use in `with` statements. */
  override BindingGroup self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gobject2.binding_group.BindingGroup]
      Returns: New builder object
  */
  static BindingGroupGidBuilder builder() nothrow
  {
    return new BindingGroupGidBuilder;
  }

  /**
      Get `source` property.
      Returns: The source object used for binding properties.
  */
  @property gid.gobject2.object.ObjectWrap source() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gobject2.object.ObjectWrap)("source");
  }

  /**
      Set `source` property.
      Params:
        propval = The source object used for binding properties.
  */
  @property void source(gid.gobject2.object.ObjectWrap propval) nothrow
  {
    setSource(propval);
  }

  /**
      Creates a new #GBindingGroup.
      Returns: a new #GBindingGroup
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GBindingGroup* _cretval;
      _cretval = g_binding_group_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Creates a binding between source_property on the source object
      and target_property on target. Whenever the source_property
      is changed the target_property is updated using the same value.
      The binding flag [gid.gobject2.types.BindingFlags.SyncCreate] is automatically specified.
      
      See [gid.gobject2.object.ObjectWrap.bindProperty] for more information.
  
      Params:
        sourceProperty = the property on the source to bind
        target = the target #GObject
        targetProperty = the property on target to bind
        flags = the flags used to create the #GBinding
  */
  void bind(string sourceProperty, gid.gobject2.object.ObjectWrap target, string targetProperty, gid.gobject2.types.BindingFlags flags) nothrow
  {
    const(char)* _sourceProperty = sourceProperty.toCString!(No.Malloc, No.Nullable);
    const(char)* _targetProperty = targetProperty.toCString!(No.Malloc, No.Nullable);
    g_binding_group_bind(cast(GBindingGroup*)this._cPtr, _sourceProperty, target ? cast(GObject*)target._cPtr(No.Dup) : null, _targetProperty, flags);
  }

  /**
      Creates a binding between source_property on the source object and
      target_property on target, allowing you to set the transformation
      functions to be used by the binding. The binding flag
      [gid.gobject2.types.BindingFlags.SyncCreate] is automatically specified.
      
      This function is the language bindings friendly version of
      g_binding_group_bind_property_full(), using #GClosures
      instead of function pointers.
      
      See [gid.gobject2.object.ObjectWrap.bindPropertyWithClosures] for more information.
  
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
  void bindFull(string sourceProperty, gid.gobject2.object.ObjectWrap target, string targetProperty, gid.gobject2.types.BindingFlags flags, gid.gobject2.closure.Closure transformTo = null, gid.gobject2.closure.Closure transformFrom = null) nothrow
  {
    const(char)* _sourceProperty = sourceProperty.toCString!(No.Malloc, No.Nullable);
    const(char)* _targetProperty = targetProperty.toCString!(No.Malloc, No.Nullable);
    g_binding_group_bind_with_closures(cast(GBindingGroup*)this._cPtr, _sourceProperty, target ? cast(GObject*)target._cPtr(No.Dup) : null, _targetProperty, flags, transformTo ? cast(GClosure*)transformTo._cPtr(No.Dup) : null, transformFrom ? cast(GClosure*)transformFrom._cPtr(No.Dup) : null);
  }

  /**
      Gets the source object used for binding properties.
      Returns: a #GObject or null.
  */
  gid.gobject2.object.ObjectWrap dupSource() nothrow
  {
    GObject* _cretval;
    _cretval = g_binding_group_dup_source(cast(GBindingGroup*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
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
  void setSource(gid.gobject2.object.ObjectWrap source = null) nothrow
  {
    g_binding_group_set_source(cast(GBindingGroup*)this._cPtr, source ? cast(GObject*)source._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gobject2.binding_group.BindingGroup]
class BindingGroupGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `source` property.
      Params:
        propval = The source object used for binding properties.
      Returns: Builder instance for fluent chaining
  */
  T source(gid.gobject2.object.ObjectWrap propval) nothrow
  {
    return setProperty("source", propval);
  }
}

/// Fluent builder for [gid.gobject2.binding_group.BindingGroup]
final class BindingGroupGidBuilder : BindingGroupGidBuilderImpl!BindingGroupGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BindingGroup build() nothrow
  {
    return new BindingGroup(cast(void*)createGObject(BindingGroup._getGType), Yes.Take);
  }
}
