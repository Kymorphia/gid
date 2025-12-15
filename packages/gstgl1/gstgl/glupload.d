/// Module for [GLUpload] class
module gstgl.glupload;

import gid.gid;
import gst.buffer;
import gst.caps;
import gst.object;
import gst.query;
import gst.types;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glcontext;
import gstgl.types;

/**
    #GstGLUpload is an object that uploads data from system memory into GL textures.
    
    A #GstGLUpload can be created with [gstgl.glupload.GLUpload.new_]
*/
class GLUpload : gst.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_upload_get_type != &gidSymbolNotFound ? gst_gl_upload_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLUpload self()
  {
    return this;
  }

  /** */
  this(gstgl.glcontext.GLContext context)
  {
    GstGLUpload* _cretval;
    _cretval = gst_gl_upload_new(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  static gst.caps.Caps getInputTemplateCaps()
  {
    GstCaps* _cretval;
    _cretval = gst_gl_upload_get_input_template_caps();
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Fixate the othercaps based on the information of the caps.
  
      Params:
        direction = the pad #GstPadDirection
        caps = a #GstCaps as the reference
        othercaps = a #GstCaps to fixate
      Returns: the fixated caps
  */
  gst.caps.Caps fixateCaps(gst.types.PadDirection direction, gst.caps.Caps caps, gst.caps.Caps othercaps)
  {
    GstCaps* _cretval;
    _cretval = gst_gl_upload_fixate_caps(cast(GstGLUpload*)this._cPtr, direction, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, othercaps ? cast(GstCaps*)othercaps._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  void getCaps(out gst.caps.Caps inCaps, out gst.caps.Caps outCaps)
  {
    GstCaps* _inCaps;
    GstCaps* _outCaps;
    gst_gl_upload_get_caps(cast(GstGLUpload*)this._cPtr, &_inCaps, &_outCaps);
    inCaps = new gst.caps.Caps(cast(void*)_inCaps, Yes.Take);
    outCaps = new gst.caps.Caps(cast(void*)_outCaps, Yes.Take);
  }

  /**
      Uploads buffer using the transformation specified by
      [gstgl.glupload.GLUpload.setCaps] creating a new #GstBuffer in outbuf_ptr.
  
      Params:
        buffer = input #GstBuffer
        outbufPtr = resulting #GstBuffer
      Returns: whether the upload was successful
  */
  gstgl.types.GLUploadReturn performWithBuffer(gst.buffer.Buffer buffer, out gst.buffer.Buffer outbufPtr)
  {
    GstGLUploadReturn _cretval;
    GstBuffer* _outbufPtr;
    _cretval = gst_gl_upload_perform_with_buffer(cast(GstGLUpload*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, &_outbufPtr);
    gstgl.types.GLUploadReturn _retval = cast(gstgl.types.GLUploadReturn)_cretval;
    outbufPtr = new gst.buffer.Buffer(cast(void*)_outbufPtr, Yes.Take);
    return _retval;
  }

  /**
      Adds the required allocation parameters to support uploading.
  
      Params:
        decideQuery = a #GstQuery from a decide allocation
        query = the proposed allocation query
  */
  void proposeAllocation(gst.query.Query decideQuery, gst.query.Query query)
  {
    gst_gl_upload_propose_allocation(cast(GstGLUpload*)this._cPtr, decideQuery ? cast(GstQuery*)decideQuery._cPtr(No.Dup) : null, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
  }

  /**
      Initializes upload with the information required for upload.
  
      Params:
        inCaps = input #GstCaps
        outCaps = output #GstCaps
      Returns: whether in_caps and out_caps could be set on upload
  */
  bool setCaps(gst.caps.Caps inCaps, gst.caps.Caps outCaps)
  {
    bool _retval;
    _retval = cast(bool)gst_gl_upload_set_caps(cast(GstGLUpload*)this._cPtr, inCaps ? cast(GstCaps*)inCaps._cPtr(No.Dup) : null, outCaps ? cast(GstCaps*)outCaps._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  void setContext(gstgl.glcontext.GLContext context)
  {
    gst_gl_upload_set_context(cast(GstGLUpload*)this._cPtr, context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
  }

  /** */
  gst.caps.Caps transformCaps(gstgl.glcontext.GLContext context, gst.types.PadDirection direction, gst.caps.Caps caps, gst.caps.Caps filter)
  {
    GstCaps* _cretval;
    _cretval = gst_gl_upload_transform_caps(cast(GstGLUpload*)this._cPtr, context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, direction, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
