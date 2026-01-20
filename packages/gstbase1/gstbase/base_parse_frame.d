/// Module for [BaseParseFrame] class
module gstbase.base_parse_frame;

import gid.gid;
import gobject.boxed;
import gst.buffer;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.types;

/**
    Frame (context) data passed to each frame parsing virtual methods.  In
    addition to providing the data to be checked for a valid frame or an already
    identified frame, it conveys additional metadata or control information
    from and to the subclass w.r.t. the particular frame in question (rather
    than global parameters).  Some of these may apply to each parsing stage, others
    only to some a particular one.  These parameters are effectively zeroed at start
    of each frame's processing, i.e. parsing virtual method invocation sequence.
*/
class BaseParseFrame : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_base_parse_frame_get_type != &gidSymbolNotFound ? gst_base_parse_frame_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BaseParseFrame self()
  {
    return this;
  }

  /**
      Get `buffer` field.
      Returns: input data to be parsed for frames.
  */
  @property gst.buffer.Buffer buffer()
  {
    return cToD!(gst.buffer.Buffer)(cast(void*)(cast(GstBaseParseFrame*)this._cPtr).buffer);
  }

  /**
      Set `buffer` field.
      Params:
        propval = input data to be parsed for frames.
  */
  @property void buffer(gst.buffer.Buffer propval)
  {
    cValueFree!(gst.buffer.Buffer)(cast(void*)(cast(GstBaseParseFrame*)this._cPtr).buffer);
    dToC(propval, cast(void*)&(cast(GstBaseParseFrame*)this._cPtr).buffer);
  }

  /**
      Get `outBuffer` field.
      Returns: output data.
  */
  @property gst.buffer.Buffer outBuffer()
  {
    return cToD!(gst.buffer.Buffer)(cast(void*)(cast(GstBaseParseFrame*)this._cPtr).outBuffer);
  }

  /**
      Set `outBuffer` field.
      Params:
        propval = output data.
  */
  @property void outBuffer(gst.buffer.Buffer propval)
  {
    cValueFree!(gst.buffer.Buffer)(cast(void*)(cast(GstBaseParseFrame*)this._cPtr).outBuffer);
    dToC(propval, cast(void*)&(cast(GstBaseParseFrame*)this._cPtr).outBuffer);
  }

  /**
      Get `flags` field.
      Returns: a combination of input and output #GstBaseParseFrameFlags that
         convey additional context to subclass or allow subclass to tune
         subsequent #GstBaseParse actions.
  */
  @property uint flags()
  {
    return (cast(GstBaseParseFrame*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = a combination of input and output #GstBaseParseFrameFlags that
           convey additional context to subclass or allow subclass to tune
           subsequent #GstBaseParse actions.
  */
  @property void flags(uint propval)
  {
    (cast(GstBaseParseFrame*)this._cPtr).flags = propval;
  }

  /**
      Get `offset` field.
      Returns: media specific offset of input frame
          Note that a converter may have a different one on the frame's buffer.
  */
  @property ulong offset()
  {
    return (cast(GstBaseParseFrame*)this._cPtr).offset;
  }

  /**
      Set `offset` field.
      Params:
        propval = media specific offset of input frame
            Note that a converter may have a different one on the frame's buffer.
  */
  @property void offset(ulong propval)
  {
    (cast(GstBaseParseFrame*)this._cPtr).offset = propval;
  }

  /**
      Get `overhead` field.
      Returns: subclass can set this to indicates the metadata overhead
          for the given frame, which is then used to enable more accurate bitrate
          computations. If this is -1, it is assumed that this frame should be
          skipped in bitrate calculation.
  */
  @property int overhead()
  {
    return (cast(GstBaseParseFrame*)this._cPtr).overhead;
  }

  /**
      Set `overhead` field.
      Params:
        propval = subclass can set this to indicates the metadata overhead
            for the given frame, which is then used to enable more accurate bitrate
            computations. If this is -1, it is assumed that this frame should be
            skipped in bitrate calculation.
  */
  @property void overhead(int propval)
  {
    (cast(GstBaseParseFrame*)this._cPtr).overhead = propval;
  }

  /**
      Allocates a new #GstBaseParseFrame. This function is mainly for bindings,
      elements written in C should usually allocate the frame on the stack and
      then use [gstbase.base_parse_frame.BaseParseFrame.init_] to initialise it.
  
      Params:
        buffer = a #GstBuffer
        flags = the flags
        overhead = number of bytes in this frame which should be counted as
              metadata overhead, ie. not used to calculate the average bitrate.
              Set to -1 to mark the entire frame as metadata. If in doubt, set to 0.
      Returns: a newly-allocated #GstBaseParseFrame. Free with
            [gstbase.base_parse_frame.BaseParseFrame.free] when no longer needed.
  */
  this(gst.buffer.Buffer buffer, gstbase.types.BaseParseFrameFlags flags, int overhead)
  {
    GstBaseParseFrame* _cretval;
    _cretval = gst_base_parse_frame_new(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, flags, overhead);
    this(_cretval, Yes.Take);
  }

  /**
      Copies a #GstBaseParseFrame.
      Returns: A copy of frame
  */
  gstbase.base_parse_frame.BaseParseFrame copy()
  {
    GstBaseParseFrame* _cretval;
    _cretval = gst_base_parse_frame_copy(cast(GstBaseParseFrame*)this._cPtr);
    auto _retval = _cretval ? new gstbase.base_parse_frame.BaseParseFrame(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Sets a #GstBaseParseFrame to initial state.  Currently this means
      all public fields are zero-ed and a private flag is set to make
      sure [gstbase.base_parse_frame.BaseParseFrame.free] only frees the contents but not
      the actual frame. Use this function to initialise a #GstBaseParseFrame
      allocated on the stack.
  */
  void init_()
  {
    gst_base_parse_frame_init(cast(GstBaseParseFrame*)this._cPtr);
  }
}
