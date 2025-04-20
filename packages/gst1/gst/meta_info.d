/// Module for [MetaInfo] class
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
class MetaInfo
{
  GstMetaInfo cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gst.meta_info.MetaInfo");

    cInstance = *cast(GstMetaInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `api` field.
      Returns: tag identifying the metadata structure and api
  */
  @property gobject.types.GType api()
  {
    return (cast(GstMetaInfo*)cPtr).api;
  }

  /**
      Set `api` field.
      Params:
        propval = tag identifying the metadata structure and api
  */
  @property void api(gobject.types.GType propval)
  {
    (cast(GstMetaInfo*)cPtr).api = propval;
  }

  /**
      Get `type` field.
      Returns: type identifying the implementor of the api
  */
  @property gobject.types.GType type()
  {
    return (cast(GstMetaInfo*)cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = type identifying the implementor of the api
  */
  @property void type(gobject.types.GType propval)
  {
    (cast(GstMetaInfo*)cPtr).type = propval;
  }

  /**
      Get `size` field.
      Returns: size of the metadata
  */
  @property size_t size()
  {
    return (cast(GstMetaInfo*)cPtr).size;
  }

  /**
      Set `size` field.
      Params:
        propval = size of the metadata
  */
  @property void size(size_t propval)
  {
    (cast(GstMetaInfo*)cPtr).size = propval;
  }

  /**
      Get `initFunc` field.
      Returns: function for initializing the metadata
  */
  @property GstMetaInitFunction initFunc()
  {
    return (cast(GstMetaInfo*)cPtr).initFunc;
  }

  /**
      Set `initFunc` field.
      Params:
        propval = function for initializing the metadata
  */

  @property void initFunc(GstMetaInitFunction propval)
  {
    (cast(GstMetaInfo*)cPtr).initFunc = propval;
  }

  /**
      Get `freeFunc` field.
      Returns: function for freeing the metadata
  */
  @property GstMetaFreeFunction freeFunc()
  {
    return (cast(GstMetaInfo*)cPtr).freeFunc;
  }

  /**
      Set `freeFunc` field.
      Params:
        propval = function for freeing the metadata
  */

  @property void freeFunc(GstMetaFreeFunction propval)
  {
    (cast(GstMetaInfo*)cPtr).freeFunc = propval;
  }

  /**
      Get `transformFunc` field.
      Returns: function for transforming the metadata
  */
  @property GstMetaTransformFunction transformFunc()
  {
    return (cast(GstMetaInfo*)cPtr).transformFunc;
  }

  /**
      Set `transformFunc` field.
      Params:
        propval = function for transforming the metadata
  */

  @property void transformFunc(GstMetaTransformFunction propval)
  {
    (cast(GstMetaInfo*)cPtr).transformFunc = propval;
  }

  /**
      Get `deserializeFunc` field.
      Returns: Function for deserializing the metadata, or null if not supported by this
      meta.
  */
  @property GstMetaDeserializeFunction deserializeFunc()
  {
    return (cast(GstMetaInfo*)cPtr).deserializeFunc;
  }

  /**
      Set `deserializeFunc` field.
      Params:
        propval = Function for deserializing the metadata, or null if not supported by this
        meta.
  */

  @property void deserializeFunc(GstMetaDeserializeFunction propval)
  {
    (cast(GstMetaInfo*)cPtr).deserializeFunc = propval;
  }

  /**
      Get `clearFunc` field.
      Returns: Function for clearing the metadata, or null if not supported by this
      meta. This is called by the buffer pool when a buffer is returned for
      pooled metas.
  */
  @property GstMetaClearFunction clearFunc()
  {
    return (cast(GstMetaInfo*)cPtr).clearFunc;
  }

  /**
      Set `clearFunc` field.
      Params:
        propval = Function for clearing the metadata, or null if not supported by this
        meta. This is called by the buffer pool when a buffer is returned for
        pooled metas.
  */

  @property void clearFunc(GstMetaClearFunction propval)
  {
    (cast(GstMetaInfo*)cPtr).clearFunc = propval;
  }

  /** */
  bool isCustom()
  {
    bool _retval;
    _retval = gst_meta_info_is_custom(cast(const(GstMetaInfo)*)cPtr);
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
    _cretval = gst_meta_info_register(cast(GstMetaInfo*)cPtr);
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
