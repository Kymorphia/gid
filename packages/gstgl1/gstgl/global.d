/// Global functions for gstgl1 library
module gstgl.global;

import gid.gid;
import gobject.types;
import gobject.value;
import gst.buffer;
import gst.context;
import gst.element;
import gst.memory;
import gst.query;
import gst.structure;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glallocation_params;
import gstgl.glcontext;
import gstgl.gldisplay;
import gstgl.glsync_meta;
import gstgl.types;
import gstvideo.types;
import gstvideo.video_affine_transformation_meta;
import gstvideo.video_alignment;
import gstvideo.video_info;


/** */
gstgl.glsync_meta.GLSyncMeta bufferAddGlSyncMeta(gstgl.glcontext.GLContext context, gst.buffer.Buffer buffer)
{
  GstGLSyncMeta* _cretval;
  _cretval = gst_buffer_add_gl_sync_meta(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gstgl.glsync_meta.GLSyncMeta(cast(GstGLSyncMeta*)_cretval, No.Take) : null;
  return _retval;
}

/** */
gstgl.glsync_meta.GLSyncMeta bufferAddGlSyncMetaFull(gstgl.glcontext.GLContext context, gst.buffer.Buffer buffer, void* data = null)
{
  GstGLSyncMeta* _cretval;
  _cretval = gst_buffer_add_gl_sync_meta_full(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, data);
  auto _retval = _cretval ? new gstgl.glsync_meta.GLSyncMeta(cast(GstGLSyncMeta*)_cretval, No.Take) : null;
  return _retval;
}

/** */
gstgl.glallocation_params.GLAllocationParams bufferPoolConfigGetGlAllocationParams(gst.structure.Structure config)
{
  GstGLAllocationParams* _cretval;
  _cretval = gst_buffer_pool_config_get_gl_allocation_params(config ? cast(GstStructure*)config._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gstgl.glallocation_params.GLAllocationParams(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    See [gstgl.global.bufferPoolConfigSetGlMinFreeQueueSize].

    Params:
      config = a buffer pool config
    Returns: then number of buffers configured the free queue
*/
uint bufferPoolConfigGetGlMinFreeQueueSize(gst.structure.Structure config)
{
  uint _retval;
  _retval = gst_buffer_pool_config_get_gl_min_free_queue_size(config ? cast(GstStructure*)config._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Sets params on config

    Params:
      config = a buffer pool config
      params = a #GstGLAllocationParams
*/
void bufferPoolConfigSetGlAllocationParams(gst.structure.Structure config, gstgl.glallocation_params.GLAllocationParams params = null)
{
  gst_buffer_pool_config_set_gl_allocation_params(config ? cast(GstStructure*)config._cPtr(No.Dup) : null, params ? cast(const(GstGLAllocationParams)*)params._cPtr(No.Dup) : null);
}

/**
    Instructs the #GstGLBufferPool to keep queue_size amount of buffers around
    before allowing them for reuse.
    
    This is helpful to allow GPU processing to complete before the CPU
    operations on the same buffer could start.  Particularly useful when
    uploading or downloading data to/from the GPU.
    
    A value of 0 disabled this functionality.
    
    This value must be less than the configured maximum amount of buffers for
    this config.

    Params:
      config = a buffer pool config
      queueSize = the number of buffers
*/
void bufferPoolConfigSetGlMinFreeQueueSize(gst.structure.Structure config, uint queueSize)
{
  gst_buffer_pool_config_set_gl_min_free_queue_size(config ? cast(GstStructure*)config._cPtr(No.Dup) : null, queueSize);
}

/** */
bool contextGetGlDisplay(gst.context.Context context, out gstgl.gldisplay.GLDisplay display)
{
  bool _retval;
  GstGLDisplay* _display;
  _retval = cast(bool)gst_context_get_gl_display(context ? cast(GstContext*)context._cPtr(No.Dup) : null, &_display);
  display = new gstgl.gldisplay.GLDisplay(cast(void*)_display, Yes.Take);
  return _retval;
}

/**
    Sets display on context

    Params:
      context = a #GstContext
      display = resulting #GstGLDisplay
*/
void contextSetGlDisplay(gst.context.Context context, gstgl.gldisplay.GLDisplay display = null)
{
  gst_context_set_gl_display(context ? cast(GstContext*)context._cPtr(No.Dup) : null, display ? cast(GstGLDisplay*)display._cPtr(No.Dup) : null);
}

/** */
bool glCheckExtension(string name, string ext)
{
  bool _retval;
  const(char)* _name = name.toCString(No.Alloc);
  const(char)* _ext = ext.toCString(No.Alloc);
  _retval = cast(bool)gst_gl_check_extension(_name, _ext);
  return _retval;
}

/** */
void glElementPropagateDisplayContext(gst.element.Element element, gstgl.gldisplay.GLDisplay display)
{
  gst_gl_element_propagate_display_context(element ? cast(GstElement*)element._cPtr(No.Dup) : null, display ? cast(GstGLDisplay*)display._cPtr(No.Dup) : null);
}

/**
    Perform the steps necessary for retrieving a #GstGLDisplay and (optionally)
    an application provided #GstGLContext from the surrounding elements or from
    the application using the #GstContext mechanism.
    
    If the contents of display_ptr or other_context_ptr are not null, then no
    #GstContext query is necessary for #GstGLDisplay or #GstGLContext retrieval
    or is performed.
    
    This performs #GstContext queries (if necessary) for a winsys display
    connection with [gstgl.types.GL_DISPLAY_CONTEXT_TYPE], "gst.x11.display.handle", and
    "GstWaylandDisplayHandleContextType" stopping after the first successful
    retrieval.
    
    This also performs a #GstContext query (if necessary) for an optional
    application provided #GstGLContext using the name "gst.gl.app_context".
    The returned #GstGLContext will be shared with a GStreamer created OpenGL context.

    Params:
      element = the #GstElement running the query
      displayPtr = the resulting #GstGLDisplay
      otherContextPtr = the resulting #GstGLContext
    Returns: whether a #GstGLDisplay exists in display_ptr
*/
bool glEnsureElementData(gst.element.Element element, gstgl.gldisplay.GLDisplay displayPtr, gstgl.glcontext.GLContext otherContextPtr)
{
  bool _retval;
  _retval = cast(bool)gst_gl_ensure_element_data(element ? cast(GstElement*)element._cPtr(No.Dup) : null, displayPtr ? cast(GstGLDisplay**)displayPtr._cPtr(No.Dup) : null, otherContextPtr ? cast(GstGLContext**)otherContextPtr._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Retrieves the stored 4x4 affine transformation matrix stored in meta in
    NDC coordinates. if meta is NULL, an identity matrix is returned.
    
    NDC is a left-handed coordinate system
    $(LIST
      * x - [-1, 1] - +ve X moves right
      * y - [-1, 1] - +ve Y moves up
      * z - [-1, 1] - +ve Z moves into
    )

    Params:
      meta = a #GstVideoAffineTransformationMeta
      matrix = result of the 4x4 matrix
*/
void glGetAffineTransformationMetaAsNdc(gstvideo.video_affine_transformation_meta.VideoAffineTransformationMeta meta, ref float[] matrix)
{
  gst_gl_get_affine_transformation_meta_as_ndc(meta ? cast(GstVideoAffineTransformationMeta*)meta._cPtr : null, matrix.ptr);
}

/**
    Retrieve the size in bytes of a video plane of data with a certain alignment

    Params:
      info = a #GstVideoInfo
      align_ = a #GstVideoAlignment or null
      plane = plane number in info to retrieve the data size of
    Returns: 
*/
size_t glGetPlaneDataSize(gstvideo.video_info.VideoInfo info, gstvideo.video_alignment.VideoAlignment align_, uint plane)
{
  size_t _retval;
  _retval = gst_gl_get_plane_data_size(info ? cast(const(GstVideoInfo)*)info._cPtr(No.Dup) : null, cast(const(GstVideoAlignment)*)&align_, plane);
  return _retval;
}

/** */
size_t glGetPlaneStart(gstvideo.video_info.VideoInfo info, gstvideo.video_alignment.VideoAlignment valign, uint plane)
{
  size_t _retval;
  _retval = gst_gl_get_plane_start(info ? cast(const(GstVideoInfo)*)info._cPtr(No.Dup) : null, cast(const(GstVideoAlignment)*)&valign, plane);
  return _retval;
}

/** */
bool glHandleContextQuery(gst.element.Element element, gst.query.Query query, gstgl.gldisplay.GLDisplay display = null, gstgl.glcontext.GLContext context = null, gstgl.glcontext.GLContext otherContext = null)
{
  bool _retval;
  _retval = cast(bool)gst_gl_handle_context_query(element ? cast(GstElement*)element._cPtr(No.Dup) : null, query ? cast(GstQuery*)query._cPtr(No.Dup) : null, display ? cast(GstGLDisplay*)display._cPtr(No.Dup) : null, context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, otherContext ? cast(GstGLContext*)otherContext._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Helper function for implementing #GstElementClass.set_context() in
    OpenGL capable elements.
    
    Retrieve's the #GstGLDisplay or #GstGLContext in context and places the
    result in display or other_context respectively.

    Params:
      element = a #GstElement
      context = a #GstContext
      display = location of a #GstGLDisplay
      otherContext = location of a #GstGLContext
    Returns: whether the display or other_context could be set successfully
*/
bool glHandleSetContext(gst.element.Element element, gst.context.Context context, out gstgl.gldisplay.GLDisplay display, out gstgl.glcontext.GLContext otherContext)
{
  bool _retval;
  GstGLDisplay* _display;
  GstGLContext* _otherContext;
  _retval = cast(bool)gst_gl_handle_set_context(element ? cast(GstElement*)element._cPtr(No.Dup) : null, context ? cast(GstContext*)context._cPtr(No.Dup) : null, &_display, &_otherContext);
  display = new gstgl.gldisplay.GLDisplay(cast(void*)_display, Yes.Take);
  otherContext = new gstgl.glcontext.GLContext(cast(void*)_otherContext, Yes.Take);
  return _retval;
}

/**
    Multiplies two 4x4 matrices, `a` and `b`, and stores the result, a
    2-dimensional array of #gfloat, in result.

    Params:
      a = a 2-dimensional 4x4 array of #gfloat
      b = another 2-dimensional 4x4 array of #gfloat
      result = the result of the multiplication
*/
void glMultiplyMatrix4(float[] a, float[] b, ref float[] result)
{
  assert(!a || a.length == 16);
  auto _a = cast(const(float)*)a.ptr;
  assert(!b || b.length == 16);
  auto _b = cast(const(float)*)b.ptr;
  gst_gl_multiply_matrix4(_a, _b, result.ptr);
}

/**
    Set the 4x4 affine transformation matrix stored in meta from the
    NDC coordinates in matrix.

    Params:
      meta = a #GstVideoAffineTransformationMeta
      matrix = a 4x4 matrix
*/
void glSetAffineTransformationMetaFromNdc(gstvideo.video_affine_transformation_meta.VideoAffineTransformationMeta meta, float[] matrix)
{
  assert(!matrix || matrix.length == 16);
  auto _matrix = cast(const(float)*)matrix.ptr;
  gst_gl_set_affine_transformation_meta_from_ndc(meta ? cast(GstVideoAffineTransformationMeta*)meta._cPtr : null, _matrix);
}

/** */
uint glSizedGlFormatFromGlFormatType(gstgl.glcontext.GLContext context, uint format, uint type)
{
  uint _retval;
  _retval = gst_gl_sized_gl_format_from_gl_format_type(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, format, type);
  return _retval;
}

/** */
gobject.types.GType glStereoDownmixModeGetType()
{
  gobject.types.GType _retval;
  _retval = gst_gl_stereo_downmix_mode_get_type();
  return _retval;
}

/**
    Given swizzle, produce inversion such that:
    
    swizzle[inversion[i]] == identity[i] where:
    $(LIST
      * identity = {0, 1, 2,...}
      * unset fields are marked by -1
    )

    Params:
      swizzle = input swizzle
      inversion = resulting inversion
*/
void glSwizzleInvert(int[] swizzle, ref int[] inversion)
{
  assert(!swizzle || swizzle.length == 4);
  auto _swizzle = cast(int*)swizzle.ptr;
  gst_gl_swizzle_invert(_swizzle, inversion.ptr);
}

/** */
gobject.types.GType glSyncMetaApiGetType()
{
  gobject.types.GType _retval;
  _retval = gst_gl_sync_meta_api_get_type();
  return _retval;
}

/**
    See [gstgl.global.glValueSetTextureTargetFromMask] for what entails a mask

    Params:
      value = an initialized #GValue of type G_TYPE_STRING
    Returns: the mask of #GstGLTextureTarget's in value or
          [gstgl.types.GLTextureTarget.None] on failure
*/
gstgl.types.GLTextureTarget glValueGetTextureTargetMask(gobject.value.Value value)
{
  GstGLTextureTarget _cretval;
  _cretval = gst_gl_value_get_texture_target_mask(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  gstgl.types.GLTextureTarget _retval = cast(gstgl.types.GLTextureTarget)_cretval;
  return _retval;
}

/** */
bool glValueSetTextureTarget(gobject.value.Value value, gstgl.types.GLTextureTarget target)
{
  bool _retval;
  _retval = cast(bool)gst_gl_value_set_texture_target(value ? cast(GValue*)value._cPtr(No.Dup) : null, target);
  return _retval;
}

/**
    A mask is a bitwise OR of (1 << target) where target is a valid
    #GstGLTextureTarget

    Params:
      value = an uninitialized #GValue
      targetMask = a bitwise mask of #GstGLTextureTarget's
    Returns: whether the target_mask could be set on value
*/
bool glValueSetTextureTargetFromMask(gobject.value.Value value, gstgl.types.GLTextureTarget targetMask)
{
  bool _retval;
  _retval = cast(bool)gst_gl_value_set_texture_target_from_mask(value ? cast(GValue*)value._cPtr(No.Dup) : null, targetMask);
  return _retval;
}

/** */
gstgl.types.GLSLVersion glVersionToGlslVersion(gstgl.types.GLAPI glApi, int maj, int min)
{
  GstGLSLVersion _cretval;
  _cretval = gst_gl_version_to_glsl_version(glApi, maj, min);
  gstgl.types.GLSLVersion _retval = cast(gstgl.types.GLSLVersion)_cretval;
  return _retval;
}

/**
    Calculates the swizzle indices for video_format and gl_format in order to
    access a texture such that accessing a texel from a texture through the swizzle
    index produces values in the order (R, G, B, A) or (Y, U, V, A).
    
    For multi-planer formats, the swizzle index uses the same component order (RGBA/YUVA)
    and should be applied after combining multiple planes into a single rgba/yuva value.
    e.g. sampling from a NV12 format would have Y from one texture and UV from
    another texture into a (Y, U, V) value.  Add an Aplha component and then
    perform swizzling.  Sampling from NV21 would produce (Y, V, U) which is then
    swizzled to (Y, U, V).

    Params:
      videoFormat = the #GstVideoFormat in use
      swizzle = the returned swizzle indices
    Returns: whether valid swizzle indices could be found
*/
bool glVideoFormatSwizzle(gstvideo.types.VideoFormat videoFormat, ref int[] swizzle)
{
  bool _retval;
  _retval = cast(bool)gst_gl_video_format_swizzle(videoFormat, swizzle.ptr);
  return _retval;
}

/**
    Note: this function first searches the first 1 kilobytes for a `#version`
    preprocessor directive and then executes [gstgl.global.glslVersionProfileFromString].

    Params:
      s = string to search for a valid `#version` string
      version_ = resulting #GstGLSLVersion
      profile = resulting #GstGLSLProfile
    Returns: TRUE if a valid `#version` string was found, FALSE otherwise
*/
bool glslStringGetVersionProfile(string s, out gstgl.types.GLSLVersion version_, out gstgl.types.GLSLProfile profile)
{
  bool _retval;
  const(char)* _s = s.toCString(No.Alloc);
  _retval = cast(bool)gst_glsl_string_get_version_profile(_s, &version_, &profile);
  return _retval;
}

/** */
bool isGlBaseMemory(gst.memory.Memory mem)
{
  bool _retval;
  _retval = cast(bool)gst_is_gl_base_memory(mem ? cast(GstMemory*)mem._cPtr(No.Dup) : null);
  return _retval;
}

/** */
bool isGlBuffer(gst.memory.Memory mem)
{
  bool _retval;
  _retval = cast(bool)gst_is_gl_buffer(mem ? cast(GstMemory*)mem._cPtr(No.Dup) : null);
  return _retval;
}

/** */
bool isGlMemory(gst.memory.Memory mem)
{
  bool _retval;
  _retval = cast(bool)gst_is_gl_memory(mem ? cast(GstMemory*)mem._cPtr(No.Dup) : null);
  return _retval;
}

/** */
bool isGlMemoryPbo(gst.memory.Memory mem)
{
  bool _retval;
  _retval = cast(bool)gst_is_gl_memory_pbo(mem ? cast(GstMemory*)mem._cPtr(No.Dup) : null);
  return _retval;
}

/** */
bool isGlRenderbuffer(gst.memory.Memory mem)
{
  bool _retval;
  _retval = cast(bool)gst_is_gl_renderbuffer(mem ? cast(GstMemory*)mem._cPtr(No.Dup) : null);
  return _retval;
}
