/// Module for [SDPKey] class
module gstsdp.sdpkey;

public import gid.basictypes;
import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.types;

/**
    The contents of the SDP "k=" field which is used to convey encryption
    keys.
*/
class SDPKey
{
  GstSDPKey _cInstance;

  /**
      Create a `sdpkey.SDPKey` wrap type.
      Params:
        type = the encryption type
        data = the encryption data
  */
  this(string type = string.init, string data = string.init) nothrow
  {
    this.type = type;
    this.data = data;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstSDPKey*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `type` field.
      Returns: the encryption type
  */
  @property string type() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstSDPKey*)this._cPtr).type);
  }

  /**
      Set `type` field.
      Params:
        propval = the encryption type
  */
  @property void type(string propval) nothrow
  {
    (cast(GstSDPKey*)this._cPtr).type = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `data` field.
      Returns: the encryption data
  */
  @property string data() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstSDPKey*)this._cPtr).data);
  }

  /**
      Set `data` field.
      Params:
        propval = the encryption data
  */
  @property void data(string propval) nothrow
  {
    (cast(GstSDPKey*)this._cPtr).data = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }
}
