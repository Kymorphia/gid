/// Module for [BufferList] class
module gst.buffer_list;

public import gid.basictypes;
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
class BufferList : gobject.boxed.BoxedWrap!(gst_buffer_list_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override BufferList self() nothrow
  {
    return this;
  }

  /**
      Creates a new, empty #GstBufferList.
      Returns: the new #GstBufferList.
  */
  this() nothrow
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
  static gst.buffer_list.BufferList newSized(uint size) nothrow
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
  size_t calculateSize() nothrow
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
  gst.buffer_list.BufferList copyDeep() nothrow
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
  bool foreach_(gst.types.BufferListFunc func) nothrow
  {
    extern(C) gboolean _funcCallback(GstBuffer** buffer, uint idx, void* userData) nothrow
    {
      bool _dretval;
      auto _dlg = cast(gst.types.BufferListFunc*)userData;
      auto _buffer = *buffer ? new gst.buffer.Buffer(cast(void*)*buffer, Yes.Take) : null;

      try
      {
        _dretval = (*_dlg)(_buffer, idx);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gst.types.BufferListFunc");
      }
      auto _retval = cast(gboolean)_dretval;
      *buffer = _buffer ? cast(GstBuffer*)_buffer._cPtr(Yes.Dup) : null;

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
      Returns: the buffer at idx in group.
            The returned buffer remains valid as long as list is valid and
            buffer is not removed from the list.
  */
  gst.buffer.Buffer get(uint idx) nothrow
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
            The returned buffer remains valid as long as list is valid and
            the buffer is not removed from the list.
  */
  gst.buffer.Buffer getWritable(uint idx) nothrow
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
  void insert(int idx, gst.buffer.Buffer buffer) nothrow
  {
    gst_buffer_list_insert(cast(GstBufferList*)this._cPtr, idx, buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null);
  }

  /**
      Tests if you can safely modify list. It is only safe to modify buffer list when
      there is only one owner of the buffer list - ie, the object is writable.
      Returns: 
  */
  bool isWritable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_buffer_list_is_writable(cast(const(GstBufferList)*)this._cPtr);
    return _retval;
  }

  /**
      Returns the number of buffers in list.
      Returns: the number of buffers in the buffer list
  */
  uint length() nothrow
  {
    uint _retval;
    _retval = gst_buffer_list_length(cast(GstBufferList*)this._cPtr);
    return _retval;
  }

  /**
      Returns a writable copy of list.
      
      If there is only one reference count on list, the caller must be the owner,
      and so this function will return the buffer list object unchanged. If on the other
      hand there is more than one reference on the object, a new buffer list object will
      be returned. The caller's reference on list will be removed, and instead the
      caller will own a reference to the returned object.
      
      In short, this function unrefs the buffer_list in the argument and refs the buffer list
      that it returns. Don't access the argument after calling this function. See
      also: [gst.buffer_list.BufferList.ref_].
      Returns: a writable buffer list which may or may not be the
            same as buffer list
  */
  gst.buffer_list.BufferList makeWritable() nothrow
  {
    GstBufferList* _cretval;
    _cretval = gst_buffer_list_make_writable(cast(GstBufferList*)this._cPtr(Yes.Dup));
    auto _retval = _cretval ? new gst.buffer_list.BufferList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Removes length buffers starting from idx in list. The following buffers
      are moved to close the gap.
  
      Params:
        idx = the index
        length = the amount to remove
  */
  void remove(uint idx, uint length) nothrow
  {
    gst_buffer_list_remove(cast(GstBufferList*)this._cPtr, idx, length);
  }

  /**
      Modifies a pointer to a #GstBufferList to point to a different
      #GstBufferList. The modification is done atomically (so this is useful for
      ensuring thread safety in some cases), and the reference counts are updated
      appropriately (the old buffer list is unreffed, the new is reffed).
      
      Either new_list or the #GstBufferList pointed to by old_list may be null.
  
      Params:
        oldList = pointer to a pointer to a
              #GstBufferList to be replaced.
        newList = pointer to a #GstBufferList that
              will replace the buffer list pointed to by old_list.
      Returns: true if new_list was different from old_list
  */
  static bool replace(ref gst.buffer_list.BufferList oldList, gst.buffer_list.BufferList newList = null) nothrow
  {
    bool _retval;
    GstBufferList* _oldList = oldList ? cast(GstBufferList*)oldList._cPtr(Yes.Dup) : null;
    _retval = cast(bool)gst_buffer_list_replace(&_oldList, newList ? cast(GstBufferList*)newList._cPtr(No.Dup) : null);
    oldList = _oldList ? new gst.buffer_list.BufferList(cast(void*)_oldList, Yes.Take) : null;
    return _retval;
  }

  /**
      Modifies a pointer to a #GstBufferList to point to a different
      #GstBufferList. This function is similar to [gst.buffer_list.BufferList.replace] except
      that it takes ownership of new_list.
  
      Params:
        oldList = pointer to a pointer to a #GstBufferList
              to be replaced.
        newList = pointer to a #GstBufferList
              that will replace the bufferlist pointed to by old_list.
      Returns: true if new_list was different from old_list
  */
  static bool take(ref gst.buffer_list.BufferList oldList, gst.buffer_list.BufferList newList = null) nothrow
  {
    bool _retval;
    GstBufferList* _oldList = oldList ? cast(GstBufferList*)oldList._cPtr(Yes.Dup) : null;
    _retval = cast(bool)gst_buffer_list_take(&_oldList, newList ? cast(GstBufferList*)newList._cPtr(Yes.Dup) : null);
    oldList = _oldList ? new gst.buffer_list.BufferList(cast(void*)_oldList, Yes.Take) : null;
    return _retval;
  }
}
