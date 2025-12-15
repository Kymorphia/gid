/// Module for [Sample] class
module gst.sample;

import gid.gid;
import gobject.boxed;
import gst.buffer;
import gst.buffer_list;
import gst.c.functions;
import gst.c.types;
import gst.caps;
import gst.segment;
import gst.structure;
import gst.types;

/**
    A #GstSample is a small object containing data, a type, timing and
    extra arbitrary information.
*/
class Sample : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_sample_get_type != &gidSymbolNotFound ? gst_sample_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Sample self()
  {
    return this;
  }

  /**
      Create a new #GstSample with the provided details.
      
      Free-function: gst_sample_unref
  
      Params:
        buffer = a #GstBuffer, or null
        caps = a #GstCaps, or null
        segment = a #GstSegment, or null
        info = a #GstStructure, or null
      Returns: the new #GstSample. gst_sample_unref()
            after usage.
  */
  this(gst.buffer.Buffer buffer = null, gst.caps.Caps caps = null, gst.segment.Segment segment = null, gst.structure.Structure info = null)
  {
    GstSample* _cretval;
    _cretval = gst_sample_new(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, segment ? cast(const(GstSegment)*)segment._cPtr(No.Dup) : null, info ? cast(GstStructure*)info._cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Get the buffer associated with sample
      Returns: the buffer of sample or null
         when there is no buffer. The buffer remains valid as long as
         sample is valid.  If you need to hold on to it for longer than
         that, take a ref to the buffer with gst_buffer_ref().
  */
  gst.buffer.Buffer getBuffer()
  {
    GstBuffer* _cretval;
    _cretval = gst_sample_get_buffer(cast(GstSample*)this._cPtr);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the buffer list associated with sample
      Returns: the buffer list of sample or null
         when there is no buffer list. The buffer list remains valid as long as
         sample is valid.  If you need to hold on to it for longer than
         that, take a ref to the buffer list with gst_mini_object_ref ().
  */
  gst.buffer_list.BufferList getBufferList()
  {
    GstBufferList* _cretval;
    _cretval = gst_sample_get_buffer_list(cast(GstSample*)this._cPtr);
    auto _retval = _cretval ? new gst.buffer_list.BufferList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the caps associated with sample
      Returns: the caps of sample or null
         when there is no caps. The caps remain valid as long as sample is
         valid.  If you need to hold on to the caps for longer than that,
         take a ref to the caps with gst_caps_ref().
  */
  gst.caps.Caps getCaps()
  {
    GstCaps* _cretval;
    _cretval = gst_sample_get_caps(cast(GstSample*)this._cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get extra information associated with sample.
      Returns: the extra info of sample.
         The info remains valid as long as sample is valid.
  */
  gst.structure.Structure getInfo()
  {
    const(GstStructure)* _cretval;
    _cretval = gst_sample_get_info(cast(GstSample*)this._cPtr);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the segment associated with sample
      Returns: the segment of sample.
         The segment remains valid as long as sample is valid.
  */
  gst.segment.Segment getSegment()
  {
    GstSegment* _cretval;
    _cretval = gst_sample_get_segment(cast(GstSample*)this._cPtr);
    auto _retval = _cretval ? new gst.segment.Segment(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Set the buffer associated with sample. sample must be writable.
  
      Params:
        buffer = A #GstBuffer
  */
  void setBuffer(gst.buffer.Buffer buffer)
  {
    gst_sample_set_buffer(cast(GstSample*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
  }

  /**
      Set the buffer list associated with sample. sample must be writable.
  
      Params:
        bufferList = a #GstBufferList
  */
  void setBufferList(gst.buffer_list.BufferList bufferList)
  {
    gst_sample_set_buffer_list(cast(GstSample*)this._cPtr, bufferList ? cast(GstBufferList*)bufferList._cPtr(No.Dup) : null);
  }

  /**
      Set the caps associated with sample. sample must be writable.
  
      Params:
        caps = A #GstCaps
  */
  void setCaps(gst.caps.Caps caps)
  {
    gst_sample_set_caps(cast(GstSample*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
  }

  /**
      Set the info structure associated with sample. sample must be writable,
      and info must not have a parent set already.
  
      Params:
        info = A #GstStructure
      Returns: 
  */
  bool setInfo(gst.structure.Structure info)
  {
    bool _retval;
    _retval = cast(bool)gst_sample_set_info(cast(GstSample*)this._cPtr, info ? cast(GstStructure*)info._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Set the segment associated with sample. sample must be writable.
  
      Params:
        segment = A #GstSegment
  */
  void setSegment(gst.segment.Segment segment)
  {
    gst_sample_set_segment(cast(GstSample*)this._cPtr, segment ? cast(const(GstSegment)*)segment._cPtr(No.Dup) : null);
  }
}
