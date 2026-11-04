/// Module for [MIKEYPayloadSPParam] class
module gstsdp.mikeypayload_spparam;

public import gid.basictypes;
import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.types;

/**
    A Type/Length/Value field for security parameters
*/
class MIKEYPayloadSPParam : StructWrap!(GstMIKEYPayloadSPParam)
{
  /**
      Create a `mikeypayload_spparam.MIKEYPayloadSPParam` wrap type.
      Params:
        type = specifies the type of the parameter
  */
  this(ubyte type = ubyte.init) nothrow
  {
    this.type = type;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Get `type` field.
      Returns: specifies the type of the parameter
  */
  @property ubyte type() nothrow
  {
    return (cast(GstMIKEYPayloadSPParam*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = specifies the type of the parameter
  */
  @property void type(ubyte propval) nothrow
  {
    (cast(GstMIKEYPayloadSPParam*)this._cPtr).type = propval;
  }

  /**
      Get `val` field.
      Returns: specifies the value of the parameter
  */
  @property ubyte[] val() nothrow
  {
    if (!(cast(GstMIKEYPayloadSPParam*)this._cPtr).val)
      return null;

    return (cast(GstMIKEYPayloadSPParam*)this._cPtr).val[0 .. (cast(GstMIKEYPayloadSPParam*)this._cPtr).len].dup;
  }
}
