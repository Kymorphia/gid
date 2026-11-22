/// Module for [SDPAttribute] class
module gid.gstsdp1.sdpattribute;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gstsdp1.c.functions;
import gid.gstsdp1.c.types;
import gid.gstsdp1.types;

/**
    The contents of the SDP "a=" field which contains a key/value pair.
*/
class SDPAttribute : StructWrap!(GstSDPAttribute)
{
  /**
      Create a `sdpattribute.SDPAttribute` wrap type.
      Params:
        key = the attribute key
        value = the attribute value or NULL when it was a property attribute
  */
  this(string key = string.init, string value = string.init) nothrow
  {
    this.key = key;
    this.value = value;
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

  private const(char)* _keyRef; // Keeps borrowed GC string alive

  /**
      Get `key` field.
      Returns: the attribute key
  */
  @property string key() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstSDPAttribute*)this._cPtr).key);
  }

  /**
      Set `key` field.
      Params:
        propval = the attribute key
  */
  @property void key(string propval) nothrow
  {
    if (_refuseBorrowedStore("key"))
      return;

    _keyRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GstSDPAttribute*)this._cPtr).key = cast(char*)_keyRef;
  }

  private const(char)* _valueRef; // Keeps borrowed GC string alive

  /**
      Get `value` field.
      Returns: the attribute value or NULL when it was a property attribute
  */
  @property string value() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstSDPAttribute*)this._cPtr).value);
  }

  /**
      Set `value` field.
      Params:
        propval = the attribute value or NULL when it was a property attribute
  */
  @property void value(string propval) nothrow
  {
    if (_refuseBorrowedStore("value"))
      return;

    _valueRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GstSDPAttribute*)this._cPtr).value = cast(char*)_valueRef;
  }

  /**
      Clear the attribute.
      Returns: GST_SDP_OK.
  */
  gid.gstsdp1.types.SDPResult clear() nothrow
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_attribute_clear(cast(GstSDPAttribute*)this._cPtr);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Set the attribute with key and value.
  
      Params:
        key = the key
        value = the value
      Returns: GST_SDP_OK.
  */
  gid.gstsdp1.types.SDPResult set(string key, string value = null) nothrow
  {
    GstSDPResult _cretval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    const(char)* _value = value.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gst_sdp_attribute_set(cast(GstSDPAttribute*)this._cPtr, _key, _value);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }
}
