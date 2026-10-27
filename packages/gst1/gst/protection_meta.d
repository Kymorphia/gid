/// Module for [ProtectionMeta] class
module gst.protection_meta;

public import gid.basictypes;
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

  /**
      Create a `protection_meta.ProtectionMeta` wrap type.
      Params:
        info = the cryptographic information needed to decrypt the sample.
  */
  this(gst.structure.Structure info = gst.structure.Structure.init) nothrow
  {
    this.info = info;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstProtectionMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `meta` field.
      Returns: the parent #GstMeta.
  */
  @property gst.meta.Meta meta() nothrow
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstProtectionMeta*)this._cPtr).meta, No.Take);
  }

  private gst.structure.Structure _infoRef; // Keeps borrowed field value alive

  /**
      Get `info` field.
      Returns: the cryptographic information needed to decrypt the sample.
  */
  @property gst.structure.Structure info() nothrow
  {
    return cToD!(gst.structure.Structure)(cast(void*)(cast(GstProtectionMeta*)this._cPtr).info);
  }

  /**
      Set `info` field.
      Params:
        propval = the cryptographic information needed to decrypt the sample.
  */
  @property void info(gst.structure.Structure propval) nothrow
  {
    _infoRef = propval;
    (cast(GstProtectionMeta*)this._cPtr).info = propval ? cast(GstStructure*)propval._cPtr(No.Dup) : null;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_protection_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
