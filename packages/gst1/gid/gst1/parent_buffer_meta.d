/// Module for [ParentBufferMeta] class
module gid.gst1.parent_buffer_meta;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gst1.buffer;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.meta;
import gid.gst1.meta_info;
import gid.gst1.types;

/**
    The #GstParentBufferMeta is a #GstMeta which can be attached to a #GstBuffer
    to hold a reference to another buffer that is only released when the child
    #GstBuffer is released.
    
    Typically, #GstParentBufferMeta is used when the child buffer is directly
    using the #GstMemory of the parent buffer, and wants to prevent the parent
    buffer from being returned to a buffer pool until the #GstMemory is available
    for re-use.
*/
class ParentBufferMeta : StructWrap!(GstParentBufferMeta)
{
  /**
      Create a `parent_buffer_meta.ParentBufferMeta` wrap type.
      Params:
        buffer = the #GstBuffer on which a reference is being held.
  */
  this(gid.gst1.buffer.Buffer buffer = gid.gst1.buffer.Buffer.init) nothrow
  {
    this.buffer = buffer;
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
      Get `parent` field.
      Returns: the parent #GstMeta structure
  */
  @property gid.gst1.meta.Meta parent() nothrow
  {
    return new gid.gst1.meta.Meta(cast(GstMeta*)&(cast(GstParentBufferMeta*)this._cPtr).parent, this);
  }

  private gid.gst1.buffer.Buffer _bufferRef; // Keeps borrowed field value alive

  /**
      Get `buffer` field.
      Returns: the #GstBuffer on which a reference is being held.
  */
  @property gid.gst1.buffer.Buffer buffer() nothrow
  {
    return cToD!(gid.gst1.buffer.Buffer)(cast(void*)(cast(GstParentBufferMeta*)this._cPtr).buffer);
  }

  /**
      Set `buffer` field.
      Params:
        propval = the #GstBuffer on which a reference is being held.
  */
  @property void buffer(gid.gst1.buffer.Buffer propval) nothrow
  {
    if (_refuseBorrowedStore("buffer"))
      return;

    _bufferRef = propval;
    (cast(GstParentBufferMeta*)this._cPtr).buffer = propval ? cast(GstBuffer*)propval._cPtr(No.Dup) : null;
  }

  /**
      Gets the global #GstMetaInfo describing  the #GstParentBufferMeta meta.
      Returns: The #GstMetaInfo
  */
  static gid.gst1.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_parent_buffer_meta_get_info();
    gid.gst1.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gid.gst1.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
