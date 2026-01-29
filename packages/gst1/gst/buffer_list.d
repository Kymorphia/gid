/// Module for [BufferList] class
module gst.buffer_list;

import gid.gid;
import gobject.boxed;
import gst.buffer;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    Buffer lists are an object containing a list of buffers.
    
    Buffer lists are created with [gst.buffer_list.BufferList.new_] and filled with data
    using [gst.buffer_list.BufferList.insert].
    
    Buffer lists can be pushed on a srcpad with [gst.pad.Pad.pushList]. This is
    interesting when multiple buffers need to be pushed in one go because it
    can reduce the amount of overhead for pushing each buffer individually.
*/
class BufferList : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_buffer_list_get_type != &gidSymbolNotFound ? gst_buffer_list_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BufferList self()
  {
    return this;
  }

  /**
      Creates a new, empty #GstBufferList.
      Returns: the new #GstBufferList.
  */
  this()
  {
    GstBufferList* _cretval;
    _cretval = gst_buffer_list_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new, empty #GstBufferList. The list will have size space
      preallocated so that memory reallocations can be avoided.
  
      Params:
        size = an initial reserved size
      Returns: the new #GstBufferList.
  */
  static gst.buffer_list.BufferList newSized(uint size)
  {
    GstBufferList* _cretval;
    _cretval = gst_buffer_list_new_sized(size);
    auto _retval = _cretval ? new gst.buffer_list.BufferList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Calculates the size of the data contained in list by adding the
      size of all buffers.
      Returns: the size of the data contained in list in bytes.
  */
  size_t calculateSize()
  {
    size_t _retval;
    _retval = gst_buffer_list_calculate_size(cast(GstBufferList*)this._cPtr);
    return _retval;
  }

  /**
      Creates a copy of the given buffer list. This will make a newly allocated
      copy of the buffers that the source buffer list contains.
      Returns: a new copy of list.
  */
  gst.buffer_list.BufferList copyDeep()
  {
    GstBufferList* _cretval;
    _cretval = gst_buffer_list_copy_deep(cast(const(GstBufferList)*)this._cPtr);
    auto _retval = _cretval ? new gst.buffer_list.BufferList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Calls func with data for each buffer in list.
      
      func can modify the passed buffer pointer or its contents. The return value
      of func defines if this function returns or if the remaining buffers in
      the list should be skipped.
  
      Params:
        func = a #GstBufferListFunc to call
      Returns: true when func returned true for each buffer in list or when
        list is empty.
  */
  bool foreach_(gst.types.BufferListFunc func)
  {
    extern(C) gboolean _funcCallback(GstBuffer** buffer, uint idx, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(gst.types.BufferListFunc*)userData;
      auto _buffer = new gst.buffer.Buffer(buffer, No.Take);

      _dretval = (*_dlg)(_buffer, idx);
      auto _retval = cast(gboolean)_dretval;
      *buffer = *cast(GstBuffer**)_buffer._cPtr;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    bool _retval;
    auto _func = func ? cast(void*)&(func) : null;
    _retval = cast(bool)gst_buffer_list_foreach(cast(GstBufferList*)this._cPtr, _funcCB, _func);
    return _retval;
  }

  /**
      Gets the buffer at idx.
      
      You must make sure that idx does not exceed the number of
      buffers available.
  
      Params:
        idx = the index
      Returns: the buffer at idx in group
            or null when there is no buffer. The buffer remains valid as
            long as list is valid and buffer is not removed from the list.
  */
  gst.buffer.Buffer get(uint idx)
  {
    GstBuffer* _cretval;
    _cretval = gst_buffer_list_get(cast(GstBufferList*)this._cPtr, idx);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the buffer at idx, ensuring it is a writable buffer.
      
      You must make sure that idx does not exceed the number of
      buffers available.
  
      Params:
        idx = the index
      Returns: the buffer at idx in group.
            The returned  buffer remains valid as long as list is valid and
            the buffer is not removed from the list.
  */
  gst.buffer.Buffer getWritable(uint idx)
  {
    GstBuffer* _cretval;
    _cretval = gst_buffer_list_get_writable(cast(GstBufferList*)this._cPtr, idx);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Inserts buffer at idx in list. Other buffers are moved to make room for
      this new buffer.
      
      A -1 value for idx will append the buffer at the end.
  
      Params:
        idx = the index
        buffer = a #GstBuffer
  */
  void insert(int idx, gst.buffer.Buffer buffer)
  {
    gst_buffer_list_insert(cast(GstBufferList*)this._cPtr, idx, buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null);
  }

  /**
      Returns the number of buffers in list.
      Returns: the number of buffers in the buffer list
  */
  uint length()
  {
    uint _retval;
    _retval = gst_buffer_list_length(cast(GstBufferList*)this._cPtr);
    return _retval;
  }

  /**
      Removes length buffers starting from idx in list. The following buffers
      are moved to close the gap.
  
      Params:
        idx = the index
        length = the amount to remove
  */
  void remove(uint idx, uint length)
  {
    gst_buffer_list_remove(cast(GstBufferList*)this._cPtr, idx, length);
  }
}
