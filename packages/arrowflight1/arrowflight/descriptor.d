/// Module for [Descriptor] class
module arrowflight.descriptor;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;
import gobject.object;

/** */
class Descriptor : gobject.object.ObjectWrap
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
    return cast(void function())gaflight_descriptor_get_type != &gidSymbolNotFound ? gaflight_descriptor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Descriptor self()
  {
    return this;
  }

  /** */
  bool equal(arrowflight.descriptor.Descriptor otherDescriptor)
  {
    bool _retval;
    _retval = cast(bool)gaflight_descriptor_equal(cast(GAFlightDescriptor*)this._cPtr, otherDescriptor ? cast(GAFlightDescriptor*)otherDescriptor._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    _cretval = gaflight_descriptor_to_string(cast(GAFlightDescriptor*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
