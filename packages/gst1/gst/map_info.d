/// Module for [MapInfo] class
module gst.map_info;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.memory;
import gst.types;

/**
    A structure containing the result of a map operation such as
    [gst.memory.Memory.map]. It contains the data and size.
    
    #GstMapInfo cannot be used with g_auto() because it is ambiguous whether it
    needs to be unmapped using [gst.buffer.Buffer.unmap] or [gst.memory.Memory.unmap]. Instead,
    #GstBufferMapInfo and #GstMemoryMapInfo can be used in that case.
*/
class MapInfo
{
  GstMapInfo _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gst.map_info.MapInfo");

    _cInstance = *cast(GstMapInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `memory` field.
      Returns: a pointer to the mapped memory
  */
  @property gst.memory.Memory memory()
  {
    return cToD!(gst.memory.Memory)(cast(void*)(cast(GstMapInfo*)this._cPtr).memory);
  }

  /**
      Set `memory` field.
      Params:
        propval = a pointer to the mapped memory
  */
  @property void memory(gst.memory.Memory propval)
  {
    cValueFree!(gst.memory.Memory)(cast(void*)(cast(GstMapInfo*)this._cPtr).memory);
    dToC(propval, cast(void*)&(cast(GstMapInfo*)this._cPtr).memory);
  }

  /**
      Get `flags` field.
      Returns: flags used when mapping the memory
  */
  @property gst.types.MapFlags flags()
  {
    return cast(gst.types.MapFlags)(cast(GstMapInfo*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = flags used when mapping the memory
  */
  @property void flags(gst.types.MapFlags propval)
  {
    (cast(GstMapInfo*)this._cPtr).flags = cast(GstMapFlags)propval;
  }

  /**
      Get `size` field.
      Returns: the valid size in @data
  */
  @property size_t size()
  {
    return (cast(GstMapInfo*)this._cPtr).size;
  }

  /**
      Set `size` field.
      Params:
        propval = the valid size in @data
  */
  @property void size(size_t propval)
  {
    (cast(GstMapInfo*)this._cPtr).size = propval;
  }

  /**
      Get `maxsize` field.
      Returns: the maximum bytes in @data
  */
  @property size_t maxsize()
  {
    return (cast(GstMapInfo*)this._cPtr).maxsize;
  }

  /**
      Set `maxsize` field.
      Params:
        propval = the maximum bytes in @data
  */
  @property void maxsize(size_t propval)
  {
    (cast(GstMapInfo*)this._cPtr).maxsize = propval;
  }
}
