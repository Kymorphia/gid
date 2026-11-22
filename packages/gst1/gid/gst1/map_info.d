/// Module for [MapInfo] class
module gid.gst1.map_info;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.memory;
import gid.gst1.types;

/**
    A structure containing the result of a map operation such as
    [gid.gst1.memory.Memory.map]. It contains the data and size.
    
    #GstMapInfo cannot be used with g_auto() because it is ambiguous whether it
    needs to be unmapped using [gid.gst1.buffer.Buffer.unmap] or [gid.gst1.memory.Memory.unmap]. Instead,
    #GstBufferMapInfo and #GstMemoryMapInfo can be used in that case.
*/
class MapInfo : StructWrap!(GstMapInfo)
{
  /**
      Create a `map_info.MapInfo` wrap type.
      Params:
        memory = a pointer to the mapped memory
        flags = flags used when mapping the memory
        maxsize = the maximum bytes in @data
  */
  this(gid.gst1.memory.Memory memory = gid.gst1.memory.Memory.init, gid.gst1.types.MapFlags flags = gid.gst1.types.MapFlags.init, size_t maxsize = size_t.init) nothrow
  {
    this.memory = memory;
    this.flags = flags;
    this.maxsize = maxsize;
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

  private gid.gst1.memory.Memory _memoryRef; // Keeps borrowed field value alive

  /**
      Get `memory` field.
      Returns: a pointer to the mapped memory
  */
  @property gid.gst1.memory.Memory memory() nothrow
  {
    return cToD!(gid.gst1.memory.Memory)(cast(void*)(cast(GstMapInfo*)this._cPtr).memory);
  }

  /**
      Set `memory` field.
      Params:
        propval = a pointer to the mapped memory
  */
  @property void memory(gid.gst1.memory.Memory propval) nothrow
  {
    if (_refuseBorrowedStore("memory"))
      return;

    _memoryRef = propval;
    (cast(GstMapInfo*)this._cPtr).memory = propval ? cast(GstMemory*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `flags` field.
      Returns: flags used when mapping the memory
  */
  @property gid.gst1.types.MapFlags flags() nothrow
  {
    return cast(gid.gst1.types.MapFlags)(cast(GstMapInfo*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = flags used when mapping the memory
  */
  @property void flags(gid.gst1.types.MapFlags propval) nothrow
  {
    (cast(GstMapInfo*)this._cPtr).flags = cast(GstMapFlags)propval;
  }

  /**
      Get `data` field.
      Returns: a pointer to the mapped data
  */
  @property ubyte[] data() nothrow
  {
    if (!(cast(GstMapInfo*)this._cPtr).data)
      return null;

    return (cast(GstMapInfo*)this._cPtr).data[0 .. (cast(GstMapInfo*)this._cPtr).size].dup;
  }

  /**
      Get `maxsize` field.
      Returns: the maximum bytes in @data
  */
  @property size_t maxsize() nothrow
  {
    return (cast(GstMapInfo*)this._cPtr).maxsize;
  }

  /**
      Set `maxsize` field.
      Params:
        propval = the maximum bytes in @data
  */
  @property void maxsize(size_t propval) nothrow
  {
    (cast(GstMapInfo*)this._cPtr).maxsize = propval;
  }

  /**
      Release the memory obtained with [gid.gst1.memory.Memory.map]
  */
  void clear() nothrow
  {
    gst_map_info_clear(cast(GstMapInfo*)this._cPtr);
  }

  /** */
  ubyte[] getData() nothrow
  {
    ubyte* _cretval;
    size_t _cretlength;
    _cretval = gst_map_info_get_data(cast(GstMapInfo*)this._cPtr, &_cretlength);
    ubyte[] _retval;

    if (_cretval)
    {
      _retval = cast(ubyte[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  /**
      Initializes info.
  */
  void init_() nothrow
  {
    gst_map_info_init(cast(GstMapInfo*)this._cPtr);
  }
}
