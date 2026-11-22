/// Module for [CustomMeta] class
module gid.gst1.custom_meta;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.meta;
import gid.gst1.structure;
import gid.gst1.types;

/**
    Extra custom metadata. The @structure field is the same as returned by
    [gid.gst1.custom_meta.CustomMeta.getStructure].
    
    Since 1.24 it can be serialized using [gid.gst1.meta.Meta.serialize] and
    [gid.gst1.meta.Meta.deserialize], but only if the #GstStructure does not contain any
    fields that cannot be serialized, see [gid.gst1.types.SerializeFlags.Strict].
*/
class CustomMeta : StructWrap!(GstCustomMeta)
{
  /**
      Create a `custom_meta.CustomMeta` wrap type.
  */
  this() nothrow
  {
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
      Returns: parent #GstMeta
  */
  @property gid.gst1.meta.Meta meta() nothrow
  {
    return new gid.gst1.meta.Meta(cast(GstMeta*)&(cast(GstCustomMeta*)this._cPtr).meta, this);
  }

  /**
      Get `structure` field.
      Returns: #GstStructure containing custom metadata.
  */
  @property gid.gst1.structure.Structure structure() nothrow
  {
    return cToD!(gid.gst1.structure.Structure)(cast(void*)(cast(GstCustomMeta*)this._cPtr).structure);
  }

  /**
      Retrieve the #GstStructure backing a custom meta, the structure's mutability
      is conditioned to the writability of the #GstBuffer meta is attached to.
      Returns: the #GstStructure backing meta
  */
  gid.gst1.structure.Structure getStructure() nothrow
  {
    GstStructure* _cretval;
    _cretval = gst_custom_meta_get_structure(cast(GstCustomMeta*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Checks whether the name of the custom meta is name
  
      Params:
        name = 
      Returns: Whether name is the name of the custom meta
  */
  bool hasName(string name) nothrow
  {
    bool _retval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gst_custom_meta_has_name(cast(GstCustomMeta*)this._cPtr, _name);
    return _retval;
  }
}
