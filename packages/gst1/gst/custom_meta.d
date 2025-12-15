/// Module for [CustomMeta] class
module gst.custom_meta;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.meta;
import gst.structure;
import gst.types;

/**
    Extra custom metadata. The @structure field is the same as returned by
    [gst.custom_meta.CustomMeta.getStructure].
    
    Since 1.24 it can be serialized using [gst.meta.Meta.serialize] and
    [gst.meta.Meta.deserialize], but only if the #GstStructure does not contain any
    fields that cannot be serialized, see [gst.types.SerializeFlags.Strict].
*/
class CustomMeta
{
  GstCustomMeta cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gst.custom_meta.CustomMeta");

    cInstance = *cast(GstCustomMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `meta` field.
      Returns: parent #GstMeta
  */
  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstCustomMeta*)this._cPtr).meta, No.Take);
  }

  /**
      Get `structure` field.
      Returns: #GstStructure containing custom metadata.
  */
  @property gst.structure.Structure structure()
  {
    return cToD!(gst.structure.Structure)(cast(void*)(cast(GstCustomMeta*)this._cPtr).structure);
  }

  /**
      Set `structure` field.
      Params:
        propval = #GstStructure containing custom metadata.
  */
  @property void structure(gst.structure.Structure propval)
  {
    cValueFree!(gst.structure.Structure)(cast(void*)(cast(GstCustomMeta*)this._cPtr).structure);
    dToC(propval, cast(void*)&(cast(GstCustomMeta*)this._cPtr).structure);
  }

  /**
      Retrieve the #GstStructure backing a custom meta, the structure's mutability
      is conditioned to the writability of the #GstBuffer meta is attached to.
      Returns: the #GstStructure backing meta
  */
  gst.structure.Structure getStructure()
  {
    GstStructure* _cretval;
    _cretval = gst_custom_meta_get_structure(cast(GstCustomMeta*)this._cPtr);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Checks whether the name of the custom meta is name
  
      Params:
        name = 
      Returns: Whether name is the name of the custom meta
  */
  bool hasName(string name)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = cast(bool)gst_custom_meta_has_name(cast(GstCustomMeta*)this._cPtr, _name);
    return _retval;
  }
}
