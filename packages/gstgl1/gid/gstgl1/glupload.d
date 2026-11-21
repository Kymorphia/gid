/// Module for [GLUpload] class
module gid.gstgl1.glupload;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gst1.buffer;
import gid.gst1.caps;
import gid.gst1.object;
import gid.gst1.query;
import gid.gst1.types;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glcontext;
import gid.gstgl1.types;

/**
    #GstGLUpload is an object that uploads data from system memory into GL textures.
    
    A #GstGLUpload can be created with [gid.gstgl1.glupload.GLUpload.new_]
*/
class GLUpload : gid.gst1.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_upload_get_type != &gidSymbolNotFound ? gst_gl_upload_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLUpload";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLUpload self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstgl1.glupload.GLUpload]
      Returns: New builder object
  */
  static GLUploadGidBuilder builder() nothrow
  {
    return new GLUploadGidBuilder;
  }

  /** */
  this(gid.gstgl1.glcontext.GLContext context) nothrow
  {
    GstGLUpload* _cretval;
    _cretval = gst_gl_upload_new(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  static gid.gst1.caps.Caps getInputTemplateCaps() nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_gl_upload_get_input_template_caps();
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
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
  gid.gst1.caps.Caps fixateCaps(gid.gst1.types.PadDirection direction, gid.gst1.caps.Caps caps, gid.gst1.caps.Caps othercaps) nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_gl_upload_fixate_caps(cast(GstGLUpload*)this._cPtr, direction, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, othercaps ? cast(GstCaps*)othercaps._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  void getCaps(out gid.gst1.caps.Caps inCaps, out gid.gst1.caps.Caps outCaps) nothrow
  {
    GstCaps* _inCaps;
    GstCaps* _outCaps;
    gst_gl_upload_get_caps(cast(GstGLUpload*)this._cPtr, &_inCaps, &_outCaps);
    if (_inCaps)
      inCaps = new gid.gst1.caps.Caps(cast(void*)_inCaps, Yes.Take);
    if (_outCaps)
      outCaps = new gid.gst1.caps.Caps(cast(void*)_outCaps, Yes.Take);
  }

  /**
      Uploads buffer using the transformation specified by
      [gid.gstgl1.glupload.GLUpload.setCaps] creating a new #GstBuffer in outbuf_ptr.
  
      Params:
        buffer = input #GstBuffer
        outbufPtr = resulting #GstBuffer
      Returns: whether the upload was successful
  */
  gid.gstgl1.types.GLUploadReturn performWithBuffer(gid.gst1.buffer.Buffer buffer, out gid.gst1.buffer.Buffer outbufPtr) nothrow
  {
    GstGLUploadReturn _cretval;
    GstBuffer* _outbufPtr;
    _cretval = gst_gl_upload_perform_with_buffer(cast(GstGLUpload*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, &_outbufPtr);
    gid.gstgl1.types.GLUploadReturn _retval = cast(gid.gstgl1.types.GLUploadReturn)_cretval;
    if (_outbufPtr)
      outbufPtr = new gid.gst1.buffer.Buffer(cast(void*)_outbufPtr, Yes.Take);
    return _retval;
  }

  /**
      Adds the required allocation parameters to support uploading.
  
      Params:
        decideQuery = a #GstQuery from a decide allocation
        query = the proposed allocation query
  */
  void proposeAllocation(gid.gst1.query.Query decideQuery, gid.gst1.query.Query query) nothrow
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
  bool setCaps(gid.gst1.caps.Caps inCaps, gid.gst1.caps.Caps outCaps) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_gl_upload_set_caps(cast(GstGLUpload*)this._cPtr, inCaps ? cast(GstCaps*)inCaps._cPtr(No.Dup) : null, outCaps ? cast(GstCaps*)outCaps._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  void setContext(gid.gstgl1.glcontext.GLContext context) nothrow
  {
    gst_gl_upload_set_context(cast(GstGLUpload*)this._cPtr, context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
  }

  /** */
  gid.gst1.caps.Caps transformCaps(gid.gstgl1.glcontext.GLContext context, gid.gst1.types.PadDirection direction, gid.gst1.caps.Caps caps, gid.gst1.caps.Caps filter) nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_gl_upload_transform_caps(cast(GstGLUpload*)this._cPtr, context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, direction, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gstgl1.glupload.GLUpload]
class GLUploadGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstgl1.glupload.GLUpload]
final class GLUploadGidBuilder : GLUploadGidBuilderImpl!GLUploadGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLUpload build() nothrow
  {
    return new GLUpload(cast(void*)createGObject(GLUpload._getGType), Yes.Take);
  }
}
