/// Module for [Meta] class
module gst.meta;

import gid.gid;
import glib.types;
import gobject.types;
import gst.buffer;
import gst.c.functions;
import gst.c.types;
import gst.custom_meta;
import gst.meta_info;
import gst.types;

/**
    The #GstMeta structure should be included as the first member of a #GstBuffer
    metadata structure. The structure defines the API of the metadata and should
    be accessible to all elements using the metadata.
    
    A metadata API is registered with [gst.meta.Meta.apiTypeRegister] which takes a
    name for the metadata API and some tags associated with the metadata.
    With [gst.meta.Meta.apiTypeHasTag] one can check if a certain metadata API
    contains a given tag.
    
    Multiple implementations of a metadata API can be registered.
    To implement a metadata API, [gst.meta.Meta.register] should be used. This
    function takes all parameters needed to create, free and transform metadata
    along with the size of the metadata. The function returns a #GstMetaInfo
    structure that contains the information for the implementation of the API.
    
    A specific implementation can be retrieved by name with [gst.meta.Meta.getInfo].
    
    See #GstBuffer for how the metadata can be added, retrieved and removed from
    buffers.
*/
class Meta
{
  GstMeta cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gst.meta.Meta");

    cInstance = *cast(GstMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `flags` field.
      Returns: extra flags for the metadata
  */
  @property gst.types.MetaFlags flags()
  {
    return cast(gst.types.MetaFlags)(cast(GstMeta*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = extra flags for the metadata
  */
  @property void flags(gst.types.MetaFlags propval)
  {
    (cast(GstMeta*)this._cPtr).flags = cast(GstMetaFlags)propval;
  }

  /**
      Get `info` field.
      Returns: pointer to the #GstMetaInfo
  */
  @property gst.meta_info.MetaInfo info()
  {
    return new gst.meta_info.MetaInfo(cast(GstMetaInfo*)(cast(GstMeta*)this._cPtr).info, No.Take);
  }

  /**
      Meta sequence number compare function. Can be used as #GCompareFunc
      or a #GCompareDataFunc.
  
      Params:
        meta2 = a #GstMeta
      Returns: a negative number if meta1 comes before meta2, 0 if both metas
          have an equal sequence number, or a positive integer if meta1 comes
          after meta2.
  */
  int compareSeqnum(gst.meta.Meta meta2)
  {
    int _retval;
    _retval = gst_meta_compare_seqnum(cast(const(GstMeta)*)this._cPtr, meta2 ? cast(const(GstMeta)*)meta2._cPtr : null);
    return _retval;
  }

  /**
      Gets seqnum for this meta.
      Returns: 
  */
  ulong getSeqnum()
  {
    ulong _retval;
    _retval = gst_meta_get_seqnum(cast(const(GstMeta)*)this._cPtr);
    return _retval;
  }

  /**
      Same as [gst.meta.Meta.serialize] but with a #GByteArray instead of
      #GstByteArrayInterface.
  
      Params:
        data = #GByteArray to append serialization data
      Returns: true on success, false otherwise.
  */
  bool serializeSimple(ubyte[] data)
  {
    bool _retval;
    auto _data = gByteArrayFromD(data);
    scope(exit) containerFree!(GByteArray*, ubyte, GidOwnership.None)(_data);
    _retval = cast(bool)gst_meta_serialize_simple(cast(const(GstMeta)*)this._cPtr, _data);
    return _retval;
  }

  /** */
  static string[] apiTypeGetTags(gobject.types.GType api)
  {
    const(char*)* _cretval;
    _cretval = gst_meta_api_type_get_tags(api);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
      Check if api was registered with tag.
  
      Params:
        api = an API
        tag = the tag to check
      Returns: true if api was registered with tag.
  */
  static bool apiTypeHasTag(gobject.types.GType api, glib.types.Quark tag)
  {
    bool _retval;
    _retval = cast(bool)gst_meta_api_type_has_tag(api, tag);
    return _retval;
  }

  /**
      Register and return a GType for the api and associate it with
      tags.
  
      Params:
        api = an API to register
        tags = tags for api
      Returns: a unique GType for api.
  */
  static gobject.types.GType apiTypeRegister(string api, string[] tags)
  {
    gobject.types.GType _retval;
    const(char)* _api = api.toCString(No.Alloc);
    char*[] _tmptags;
    foreach (s; tags)
      _tmptags ~= s.toCString(No.Alloc);
    _tmptags ~= null;
    const(char*)* _tags = _tmptags.ptr;
    _retval = gst_meta_api_type_register(_api, _tags);
    return _retval;
  }

  /**
      Recreate a #GstMeta from serialized data returned by
      [gst.meta.Meta.serialize] and add it to buffer.
      
      Note that the meta must have been previously registered by calling one of
      `gst_*_meta_get_info ()` functions.
      
      consumed is set to the number of bytes that can be skipped from data to
      find the next meta serialization, if any. In case of parsing error that does
      not allow to determine that size, consumed is set to 0.
  
      Params:
        buffer = a #GstBuffer
        data = serialization data obtained from [gst.meta.Meta.serialize]
        consumed = total size used by this meta, could be less than size
      Returns: the metadata owned by buffer, or null.
  */
  static gst.meta.Meta deserialize(gst.buffer.Buffer buffer, ubyte[] data, out uint consumed)
  {
    GstMeta* _cretval;
    size_t _size;
    if (data)
      _size = cast(size_t)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    _cretval = gst_meta_deserialize(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, _data, _size, cast(uint*)&consumed);
    auto _retval = _cretval ? new gst.meta.Meta(cast(GstMeta*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Lookup a previously registered meta info structure by its implementation name
      impl.
  
      Params:
        impl = the name
      Returns: a #GstMetaInfo with impl, or
        null when no such metainfo exists.
  */
  static gst.meta_info.MetaInfo getInfo(string impl)
  {
    const(GstMetaInfo)* _cretval;
    const(char)* _impl = impl.toCString(No.Alloc);
    _cretval = gst_meta_get_info(_impl);
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Register a new custom #GstMeta implementation, backed by an opaque
      structure holding a #GstStructure.
      
      The registered info can be retrieved later with [gst.meta.Meta.getInfo] by using
      name as the key.
      
      The backing #GstStructure can be retrieved with
      [gst.custom_meta.CustomMeta.getStructure], its mutability is conditioned by the
      writability of the buffer the meta is attached to.
      
      When transform_func is null, the meta and its backing #GstStructure
      will always be copied when the transform operation is copy, other operations
      are discarded, copy regions are ignored.
  
      Params:
        name = the name of the #GstMeta implementation
        tags = tags for api
        transformFunc = a #GstMetaTransformFunction
      Returns: a #GstMetaInfo that can be used to
        access metadata.
  */
  static gst.meta_info.MetaInfo registerCustom(string name, string[] tags, gst.types.CustomMetaTransformFunction transformFunc = null)
  {
    extern(C) gboolean _transformFuncCallback(GstBuffer* transbuf, GstCustomMeta* meta, GstBuffer* buffer, GQuark type, void* data, void* userData)
    {
      auto _dlg = cast(gst.types.CustomMetaTransformFunction*)userData;

      gboolean _retval = (*_dlg)(transbuf ? new gst.buffer.Buffer(cast(void*)transbuf, No.Take) : null, meta ? new gst.custom_meta.CustomMeta(cast(void*)meta, No.Take) : null, buffer ? new gst.buffer.Buffer(cast(void*)buffer, No.Take) : null, type, data);
      return _retval;
    }
    auto _transformFuncCB = transformFunc ? &_transformFuncCallback : null;

    const(GstMetaInfo)* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    char*[] _tmptags;
    foreach (s; tags)
      _tmptags ~= s.toCString(No.Alloc);
    _tmptags ~= null;
    const(char*)* _tags = _tmptags.ptr;

    auto _transformFunc = transformFunc ? freezeDelegate(cast(void*)&transformFunc) : null;
    GDestroyNotify _transformFuncDestroyCB = transformFunc ? &thawDelegate : null;
    _cretval = gst_meta_register_custom(_name, _tags, _transformFuncCB, _transformFunc, _transformFuncDestroyCB);
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Simplified version of [gst.meta.Meta.registerCustom], with no tags and no
      transform function.
  
      Params:
        name = the name of the #GstMeta implementation
      Returns: a #GstMetaInfo that can be used to access metadata.
  */
  static gst.meta_info.MetaInfo registerCustomSimple(string name)
  {
    const(GstMetaInfo)* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_meta_register_custom_simple(_name);
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval, No.Take) : null;
    return _retval;
  }
}
