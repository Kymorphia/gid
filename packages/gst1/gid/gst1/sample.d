/// Module for [Sample] class
module gid.gst1.sample;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.boxed;
import gid.gst1.buffer;
import gid.gst1.buffer_list;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.caps;
import gid.gst1.segment;
import gid.gst1.structure;
import gid.gst1.types;

/**
    A #GstSample is a small object containing data, a type, timing and
    extra arbitrary information.
*/
class Sample : gid.gobject2.boxed.BoxedWrap!(gst_sample_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Sample self() nothrow
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
      Returns: the new #GstSample. [gid.gst1.sample.Sample.unref]
            after usage.
  */
  this(gid.gst1.buffer.Buffer buffer = null, gid.gst1.caps.Caps caps = null, gid.gst1.segment.Segment* segment = null, gid.gst1.structure.Structure info = null) nothrow
  {
    GstSample* _cretval;
    _cretval = gst_sample_new(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, cast(const(GstSegment)*)segment, info ? cast(GstStructure*)info._cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Get the buffer associated with sample
      Returns: the buffer of sample or null
         when there is no buffer. The buffer remains valid as long as
         sample is valid.  If you need to hold on to it for longer than
         that, take a ref to the buffer with [gid.gst1.buffer.Buffer.ref_].
  */
  gid.gst1.buffer.Buffer getBuffer() nothrow
  {
    GstBuffer* _cretval;
    _cretval = gst_sample_get_buffer(cast(GstSample*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the buffer list associated with sample
      Returns: the buffer list of sample or null
         when there is no buffer list. The buffer list remains valid as long as
         sample is valid.  If you need to hold on to it for longer than
         that, take a ref to the buffer list with gst_mini_object_ref ().
  */
  gid.gst1.buffer_list.BufferList getBufferList() nothrow
  {
    GstBufferList* _cretval;
    _cretval = gst_sample_get_buffer_list(cast(GstSample*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.buffer_list.BufferList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the caps associated with sample
      Returns: the caps of sample or null
         when there is no caps. The caps remain valid as long as sample is
         valid.  If you need to hold on to the caps for longer than that,
         take a ref to the caps with [gid.gst1.caps.Caps.ref_].
  */
  gid.gst1.caps.Caps getCaps() nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_sample_get_caps(cast(GstSample*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get extra information associated with sample.
      Returns: the extra info of sample.
         The info remains valid as long as sample is valid.
  */
  gid.gst1.structure.Structure getInfo() nothrow
  {
    const(GstStructure)* _cretval;
    _cretval = gst_sample_get_info(cast(GstSample*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the segment associated with sample
      Returns: the segment of sample.
         The segment remains valid as long as sample is valid.
  */
  gid.gst1.segment.Segment getSegment() nothrow
  {
    GstSegment* _cretval;
    _cretval = gst_sample_get_segment(cast(GstSample*)this._cPtr);
    gid.gst1.segment.Segment _retval;
    if (_cretval)
      _retval = *cast(gid.gst1.segment.Segment*)_cretval;
    return _retval;
  }

  /**
      Tests if you can safely set the buffer and / or buffer list of sample.
      Returns: 
  */
  bool isWritable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_sample_is_writable(cast(const(GstSample)*)this._cPtr);
    return _retval;
  }

  /**
      Returns a writable copy of sample. If the source sample is
      already writable, this will simply return the same sample.
      
      Use this function to ensure that a sample can be safely modified before
      making changes to it, for example before calling [gid.gst1.sample.Sample.setBuffer]
      
      If the reference count of the source sample sample is exactly one, the caller
      is the sole owner and this function will return the sample object unchanged.
      
      If there is more than one reference on the object, a copy will be made using
      [gid.gst1.sample.Sample.copy]. The passed-in sample will be unreffed in that case, and the
      caller will now own a reference to the new returned sample object.
      
      In short, this function unrefs the sample in the argument and refs the sample
      that it returns. Don't access the argument after calling this function unless
      you have an additional reference to it.
      Returns: a writable sample which may or may not be the
            same as sample
  */
  gid.gst1.sample.Sample makeWritable() nothrow
  {
    GstSample* _cretval;
    _cretval = gst_sample_make_writable(cast(GstSample*)this._cPtr(Yes.Dup));
    auto _retval = _cretval ? new gid.gst1.sample.Sample(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Set the buffer associated with sample. sample must be writable.
  
      Params:
        buffer = A #GstBuffer
  */
  void setBuffer(gid.gst1.buffer.Buffer buffer) nothrow
  {
    gst_sample_set_buffer(cast(GstSample*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
  }

  /**
      Set the buffer list associated with sample. sample must be writable.
  
      Params:
        bufferList = a #GstBufferList
  */
  void setBufferList(gid.gst1.buffer_list.BufferList bufferList) nothrow
  {
    gst_sample_set_buffer_list(cast(GstSample*)this._cPtr, bufferList ? cast(GstBufferList*)bufferList._cPtr(No.Dup) : null);
  }

  /**
      Set the caps associated with sample. sample must be writable.
  
      Params:
        caps = A #GstCaps
  */
  void setCaps(gid.gst1.caps.Caps caps) nothrow
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
  bool setInfo(gid.gst1.structure.Structure info) nothrow
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
  void setSegment(gid.gst1.segment.Segment segment) nothrow
  {
    gst_sample_set_segment(cast(GstSample*)this._cPtr, cast(const(GstSegment)*)&segment);
  }
}
