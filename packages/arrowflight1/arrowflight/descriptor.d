/// Module for [Descriptor] class
module arrowflight.descriptor;

public import gid.basictypes;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class Descriptor : gobject.object.ObjectWrap
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
    return cast(void function())gaflight_descriptor_get_type != &gidSymbolNotFound ? gaflight_descriptor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Descriptor self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrowflight.descriptor.Descriptor]
      Returns: New builder object
  */
  static DescriptorGidBuilder builder() nothrow
  {
    return new DescriptorGidBuilder;
  }

  /** */
  bool equal(arrowflight.descriptor.Descriptor otherDescriptor) nothrow
  {
    bool _retval;
    _retval = cast(bool)gaflight_descriptor_equal(cast(GAFlightDescriptor*)this._cPtr, otherDescriptor ? cast(GAFlightDescriptor*)otherDescriptor._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  string toString_() nothrow
  {
    char* _cretval;
    _cretval = gaflight_descriptor_to_string(cast(GAFlightDescriptor*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrowflight.descriptor.Descriptor]
class DescriptorGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T descriptor(void* propval) nothrow
  {
    return setProperty("descriptor", propval);
  }
}

/// Fluent builder for [arrowflight.descriptor.Descriptor]
final class DescriptorGidBuilder : DescriptorGidBuilderImpl!DescriptorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Descriptor build() nothrow
  {
    return new Descriptor(cast(void*)createGObject(Descriptor._getGType), No.Take);
  }
}
