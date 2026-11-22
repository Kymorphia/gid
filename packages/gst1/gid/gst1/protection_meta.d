/// Module for [ProtectionMeta] class
module gid.gst1.protection_meta;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.meta;
import gid.gst1.meta_info;
import gid.gst1.structure;
import gid.gst1.types;

/**
    Metadata type that holds information about a sample from a protection-protected
    track, including the information needed to decrypt it (if it is encrypted).
*/
class ProtectionMeta : StructWrap!(GstProtectionMeta)
{
  /**
      Create a `protection_meta.ProtectionMeta` wrap type.
      Params:
        info = the cryptographic information needed to decrypt the sample.
  */
  this(gid.gst1.structure.Structure info = gid.gst1.structure.Structure.init) nothrow
  {
    this.info = info;
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
      Get `meta` field.
      Returns: the parent #GstMeta.
  */
  @property gid.gst1.meta.Meta meta() nothrow
  {
    return new gid.gst1.meta.Meta(cast(GstMeta*)&(cast(GstProtectionMeta*)this._cPtr).meta, this);
  }

  private gid.gst1.structure.Structure _infoRef; // Keeps borrowed field value alive

  /**
      Get `info` field.
      Returns: the cryptographic information needed to decrypt the sample.
  */
  @property gid.gst1.structure.Structure info() nothrow
  {
    return cToD!(gid.gst1.structure.Structure)(cast(void*)(cast(GstProtectionMeta*)this._cPtr).info);
  }

  /**
      Set `info` field.
      Params:
        propval = the cryptographic information needed to decrypt the sample.
  */
  @property void info(gid.gst1.structure.Structure propval) nothrow
  {
    if (_refuseBorrowedStore("info"))
      return;

    _infoRef = propval;
    (cast(GstProtectionMeta*)this._cPtr).info = propval ? cast(GstStructure*)propval._cPtr(No.Dup) : null;
  }

  /** */
  static gid.gst1.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_protection_meta_get_info();
    gid.gst1.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gid.gst1.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
