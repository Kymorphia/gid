/// Module for [ParentBufferMeta] class
module gst.parent_buffer_meta;

import gid.gid;
import gst.buffer;
import gst.c.functions;
import gst.c.types;
import gst.meta;
import gst.meta_info;
import gst.types;

/**
    The #GstParentBufferMeta is a #GstMeta which can be attached to a #GstBuffer
    to hold a reference to another buffer that is only released when the child
    #GstBuffer is released.
    
    Typically, #GstParentBufferMeta is used when the child buffer is directly
    using the #GstMemory of the parent buffer, and wants to prevent the parent
    buffer from being returned to a buffer pool until the #GstMemory is available
    for re-use.
*/
class ParentBufferMeta
{
  GstParentBufferMeta _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gst.parent_buffer_meta.ParentBufferMeta");

    _cInstance = *cast(GstParentBufferMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `parent` field.
      Returns: the parent #GstMeta structure
  */
  @property gst.meta.Meta parent()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstParentBufferMeta*)this._cPtr).parent, No.Take);
  }

  /**
      Get `buffer` field.
      Returns: the #GstBuffer on which a reference is being held.
  */
  @property gst.buffer.Buffer buffer()
  {
    return cToD!(gst.buffer.Buffer)(cast(void*)(cast(GstParentBufferMeta*)this._cPtr).buffer);
  }

  /**
      Set `buffer` field.
      Params:
        propval = the #GstBuffer on which a reference is being held.
  */
  @property void buffer(gst.buffer.Buffer propval)
  {
    cValueFree!(gst.buffer.Buffer)(cast(void*)(cast(GstParentBufferMeta*)this._cPtr).buffer);
    dToC(propval, cast(void*)&(cast(GstParentBufferMeta*)this._cPtr).buffer);
  }

  /**
      Gets the global #GstMetaInfo describing  the #GstParentBufferMeta meta.
      Returns: The #GstMetaInfo
  */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_parent_buffer_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
