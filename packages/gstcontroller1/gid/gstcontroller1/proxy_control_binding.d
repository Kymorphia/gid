/// Module for [ProxyControlBinding] class
module gid.gstcontroller1.proxy_control_binding;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gst1.control_binding;
import gid.gst1.object;
import gid.gstcontroller1.c.functions;
import gid.gstcontroller1.c.types;
import gid.gstcontroller1.types;

/**
    A #GstControlBinding that forwards requests to another #GstControlBinding
*/
@gidGir("ProxyControlBinding", "ProxyControlBindingClass")
class ProxyControlBinding : gid.gst1.control_binding.ControlBinding
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_proxy_control_binding_get_type != &gidSymbolNotFound ? gst_proxy_control_binding_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstProxyControlBinding";
  }

  /** Returns `this`, for use in `with` statements. */
  override ProxyControlBinding self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstcontroller1.proxy_control_binding.ProxyControlBinding]
      Returns: New builder object
  */
  static ProxyControlBindingGidBuilder builder() nothrow
  {
    return new ProxyControlBindingGidBuilder;
  }

  /**
      #GstProxyControlBinding forwards all access to data or `sync_values()`
      requests from property_name on object to the control binding at
      ref_property_name on ref_object.
  
      Params:
        object = a #GstObject
        propertyName = the property name in object to control
        refObject = a #GstObject to forward all
                       #GstControlBinding requests to
        refPropertyName = the property_name in ref_object to control
      Returns: a new #GstControlBinding that proxies the control interface between
        properties on different #GstObject's
  */
  this(gid.gst1.object.ObjectWrap object, string propertyName, gid.gst1.object.ObjectWrap refObject, string refPropertyName) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GstControlBinding* _cretval;
      const(char)* _propertyName = propertyName.toCString!(No.Malloc, No.Nullable);
      const(char)* _refPropertyName = refPropertyName.toCString!(No.Malloc, No.Nullable);
      _cretval = gst_proxy_control_binding_new(object ? cast(GstObject*)object._cPtr(No.Dup) : null, _propertyName, refObject ? cast(GstObject*)refObject._cPtr(No.Dup) : null, _refPropertyName);
      this(_cretval, No.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gstcontroller1.proxy_control_binding.ProxyControlBinding]
class ProxyControlBindingGidBuilderImpl(T) : gid.gst1.control_binding.ControlBindingGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstcontroller1.proxy_control_binding.ProxyControlBinding]
final class ProxyControlBindingGidBuilder : ProxyControlBindingGidBuilderImpl!ProxyControlBindingGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ProxyControlBinding build() nothrow
  {
    return new ProxyControlBinding(cast(void*)createGObject(ProxyControlBinding._getGType), Yes.Take);
  }
}
