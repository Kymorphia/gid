/// Module for [MetaInfo] struct
module gst.meta_info;

import gid.gid;
import gobject.types;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    The #GstMetaInfo provides information about a specific metadata
    structure.
*/
struct MetaInfo
{
  /**
      tag identifying the metadata structure and api
  */
  GType api;

  /**
      type identifying the implementor of the api
  */
  GType type;

  /**
      size of the metadata
  */
  size_t size;

  /**
      function for initializing the metadata
  */
  GstMetaInitFunction initFunc;

  /**
      function for freeing the metadata
  */
  GstMetaFreeFunction freeFunc;

  /**
      function for transforming the metadata
  */
  GstMetaTransformFunction transformFunc;

  /**
      Function for serializing the metadata, or null if not supported by this
      meta.
  */
  GstMetaSerializeFunction serializeFunc;

  /**
      Function for deserializing the metadata, or null if not supported by this
      meta.
  */
  GstMetaDeserializeFunction deserializeFunc;

  /**
      Function for clearing the metadata, or null if not supported by this
      meta. This is called by the buffer pool when a buffer is returned for
      pooled metas.
  */
  GstMetaClearFunction clearFunc;

  /** */
  bool isCustom()
  {
    bool _retval;
    _retval = cast(bool)gst_meta_info_is_custom(cast(const(GstMetaInfo)*)&this);
    return _retval;
  }

  /**
      Registers a new meta.
      
      Use the structure returned by [gst.meta_info.MetaInfo.new_], it consumes it and the
      structure shouldnt be used after. The one returned by the function can be
      kept.
      Returns: the registered meta
  */
  gst.meta_info.MetaInfo register()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_meta_info_register(cast(GstMetaInfo*)&this);
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
