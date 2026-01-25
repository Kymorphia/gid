/// Module for [ProtectionMeta] class
module gst.protection_meta;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.meta;
import gst.meta_info;
import gst.structure;
import gst.types;

/**
    Metadata type that holds information about a sample from a protection-protected
    track, including the information needed to decrypt it (if it is encrypted).
*/
class ProtectionMeta
{
  GstProtectionMeta _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gst.protection_meta.ProtectionMeta");

    _cInstance = *cast(GstProtectionMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `meta` field.
      Returns: the parent #GstMeta.
  */
  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstProtectionMeta*)this._cPtr).meta, No.Take);
  }

  /**
      Get `info` field.
      Returns: the cryptographic information needed to decrypt the sample.
  */
  @property gst.structure.Structure info()
  {
    return cToD!(gst.structure.Structure)(cast(void*)(cast(GstProtectionMeta*)this._cPtr).info);
  }

  /**
      Set `info` field.
      Params:
        propval = the cryptographic information needed to decrypt the sample.
  */
  @property void info(gst.structure.Structure propval)
  {
    cValueFree!(gst.structure.Structure)(cast(void*)(cast(GstProtectionMeta*)this._cPtr).info);
    dToC(propval, cast(void*)&(cast(GstProtectionMeta*)this._cPtr).info);
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_protection_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
