/// D types for gstgl1 library
module gid.gstgl1.types;

import gid.core.utils;
import gid.gst1.map_info;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glallocation_params;
import gid.gstgl1.glbase_memory;
import gid.gstgl1.glbase_memory_allocator;
import gid.gstgl1.glcontext;
import gid.gstgl1.glfilter;
import gid.gstgl1.glmemory;


// Enums

/** */
alias GLAPI = GstGLAPI;

/** */
alias GLBaseMemoryError = GstGLBaseMemoryError;

/** */
alias GLBaseMemoryTransfer = GstGLBaseMemoryTransfer;

/** */
alias GLConfigCaveat = GstGLConfigCaveat;

/** */
alias GLConfigSurfaceType = GstGLConfigSurfaceType;

/** */
alias GLContextError = GstGLContextError;

/** */
alias GLDisplayType = GstGLDisplayType;

/** */
alias GLDrmFormatFlags = GstGLDrmFormatFlags;

/** */
alias GLFormat = GstGLFormat;

/** */
alias GLPlatform = GstGLPlatform;

/** */
alias GLQueryType = GstGLQueryType;

/** */
alias GLSLError = GstGLSLError;

/** */
alias GLSLProfile = GstGLSLProfile;

/** */
alias GLSLVersion = GstGLSLVersion;

/** */
alias GLStereoDownmix = GstGLStereoDownmix;

/** */
alias GLTextureTarget = GstGLTextureTarget;

/** */
alias GLUploadReturn = GstGLUploadReturn;

/** */
alias GLWindowError = GstGLWindowError;

// Structs

/** */
alias GLFuncs = GstGLFuncs*;

// Callbacks

/**
    Copies the parameters from src into dest.  The subclass must compose copy
    functions from the superclass.

    Params:
      src = the source #GstGLAllocationParams to copy from (modified in place, changes are seen by the caller)
      dest = the source #GstGLAllocationParams to copy (modified in place, changes are seen by the caller)
*/
alias GLAllocationParamsCopyFunc = void delegate(gid.gstgl1.glallocation_params.GLAllocationParams src, gid.gstgl1.glallocation_params.GLAllocationParams dest);

/**
    Free any dynamically allocated data.  The subclass must call the superclass'
    free.

    Params:
      params = a #GstGLAllocationParams
*/
alias GLAllocationParamsFreeFunc = void delegate(void* params);

/** */
alias GLAsyncDebugLogGetMessage = string delegate();

/**
    Note: not called with a GL context current

    Params:
      allocator = a #GstGLBaseMemoryAllocator
      params = the #GstGLAllocationParams to allocate the memory with (modified in place, changes are seen by the caller)
    Returns: a newly allocated #GstGLBaseMemory from allocator and params
*/
alias GLBaseMemoryAllocatorAllocFunction = gid.gstgl1.glbase_memory.GLBaseMemory delegate(gid.gstgl1.glbase_memory_allocator.GLBaseMemoryAllocator allocator, gid.gstgl1.glallocation_params.GLAllocationParams params);

/**
    Also see [gid.gst1.memory.Memory.copy];

    Params:
      mem = a #GstGLBaseMemory (modified in place, changes are seen by the caller)
      offset = the offset to copy from
      size = the number of bytes to copy
    Returns: the newly copied #GstGLMemory or null
*/
alias GLBaseMemoryAllocatorCopyFunction = gid.gstgl1.glbase_memory.GLBaseMemory delegate(gid.gstgl1.glbase_memory.GLBaseMemory mem, ptrdiff_t offset, ptrdiff_t size);

/**
    As this virtual method is called with an OpenGL context current, use this
    function to allocate and OpenGL resources needed for your application

    Params:
      mem = a #GstGLBaseMemory (modified in place, changes are seen by the caller)
    Returns: whether the creation succeeded
    Throws: [ErrorWrap]
*/
alias GLBaseMemoryAllocatorCreateFunction = bool delegate(gid.gstgl1.glbase_memory.GLBaseMemory mem, GError **_err);

/**
    Destroy any resources allocated throughout the lifetime of mem

    Params:
      mem = a #GstGLBaseMemory (modified in place, changes are seen by the caller)
*/
alias GLBaseMemoryAllocatorDestroyFunction = void delegate(gid.gstgl1.glbase_memory.GLBaseMemory mem);

/**
    Also see [gid.gst1.memory.Memory.map];

    Params:
      mem = a #GstGLBaseMemory (modified in place, changes are seen by the caller)
      info = a #GstMapInfo to map with (borrowed, only valid during the callback)
      maxsize = the size to map
    Returns: the mapped pointer
*/
alias GLBaseMemoryAllocatorMapFunction = void* delegate(gid.gstgl1.glbase_memory.GLBaseMemory mem, gid.gst1.map_info.MapInfo info, size_t maxsize);

/**
    Also see [gid.gst1.memory.Memory.unmap];

    Params:
      mem = a #GstGLBaseMemory (modified in place, changes are seen by the caller)
      info = a #GstMapInfo to map with (borrowed, only valid during the callback)
*/
alias GLBaseMemoryAllocatorUnmapFunction = void delegate(gid.gstgl1.glbase_memory.GLBaseMemory mem, gid.gst1.map_info.MapInfo info);

/**
    Represents a function to run in the GL thread with context and data

    Params:
      context = a #GstGLContext
*/
alias GLContextThreadFunc = void delegate(gid.gstgl1.glcontext.GLContext context);

/** */
alias GLFilterRenderFunc = bool delegate(gid.gstgl1.glfilter.GLFilter filter, gid.gstgl1.glmemory.GLMemory inTex);

/**
    callback definition for operating through a #GstGLFramebuffer object
    Returns: 
*/
alias GLFramebufferFunc = bool delegate();

/** */
alias GLWindowCB = void delegate();

/** */
alias GLWindowResizeCB = void delegate(uint width, uint height);

/**
    An option that can be activated on bufferpools to request OpenGL
    synchronization metadata on buffers from the pool.
*/
enum BUFFER_POOL_OPTION_GL_SYNC_META = "GstBufferPoolOptionGLSyncMeta";

/**
    String used for [gid.gstgl1.types.GLTextureTarget._2d] as a #GstBufferPool pool option
*/
enum BUFFER_POOL_OPTION_GL_TEXTURE_TARGET_2D = "GstBufferPoolOptionGLTextureTarget2D";

/**
    String used for [gid.gstgl1.types.GLTextureTarget.ExternalOes] as a #GstBufferPool pool option
*/
enum BUFFER_POOL_OPTION_GL_TEXTURE_TARGET_EXTERNAL_OES = "GstBufferPoolOptionGLTextureTargetExternalOES";

/**
    String used for [gid.gstgl1.types.GLTextureTarget.Rectangle] as a #GstBufferPool pool option
*/
enum BUFFER_POOL_OPTION_GL_TEXTURE_TARGET_RECTANGLE = "GstBufferPoolOptionGLTextureTargetRectangle";

/**
    Name of the caps feature indicating the use of GL buffers
*/
enum CAPS_FEATURE_MEMORY_GL_BUFFER = "memory:GLBuffer";

/**
    Name of the caps feature for indicating the use of #GstGLMemory
*/
enum CAPS_FEATURE_MEMORY_GL_MEMORY = "memory:GLMemory";

/**
    GL Allocation flag indicating that the implementation should allocate the
    necessary resources.
*/
enum GL_ALLOCATION_PARAMS_ALLOC_FLAG_ALLOC = 1;

/**
    GL allocation flag indicating the allocation of a GL buffer.
*/
enum GL_ALLOCATION_PARAMS_ALLOC_FLAG_BUFFER = 16;

/**
    Values >= than #GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_USER can be used for
    user-defined purposes.
*/
enum GL_ALLOCATION_PARAMS_ALLOC_FLAG_USER = 65536;

/**
    GL allocation flag indicating the allocation of 2D video frames
*/
enum GL_ALLOCATION_PARAMS_ALLOC_FLAG_VIDEO = 8;

/**
    GL Allocation flag for using the provided GPU handle as storage.
*/
enum GL_ALLOCATION_PARAMS_ALLOC_FLAG_WRAP_GPU_HANDLE = 4;

/**
    GL Allocation flag for using the provided system memory data as storage.
*/
enum GL_ALLOCATION_PARAMS_ALLOC_FLAG_WRAP_SYSMEM = 2;

/**
    The name for [gid.gstgl1.types.GLAPI.Gles1] used in various places
*/
enum GL_API_GLES1_NAME = "gles1";

/**
    The name for [gid.gstgl1.types.GLAPI.Gles2] used in various places
*/
enum GL_API_GLES2_NAME = "gles2";

/**
    The name for [gid.gstgl1.types.GLAPI.Opengl3] used in various places
*/
enum GL_API_OPENGL3_NAME = "opengl3";

/**
    The name for [gid.gstgl1.types.GLAPI.Opengl] used in various places
*/
enum GL_API_OPENGL_NAME = "opengl";

/**
    The name of the GL buffer allocator
*/
enum GL_BASE_MEMORY_ALLOCATOR_NAME = "GLBaseMemory";

/**
    The name of the GL buffer allocator
*/
enum GL_BUFFER_ALLOCATOR_NAME = "GLBuffer";

/** */
enum GL_COLOR_CONVERT_EXT_FORMATS = ", RGBA64_LE, BGR10A2_LE, RGB10A2_LE, BGR10x2_LE, RGB10x2_LE, P010_10LE, P012_LE, P016_LE, Y212_LE, Y412_LE, A444_16LE, A422_16LE, A420_16LE, A444_12LE, A422_12LE, A420_12LE, A420_10LE, A422_10LE, A444_10LE, I420_12LE, I420_10LE, I422_10LE, I422_12LE, Y444_16LE, Y444_12LE, Y444_10LE";

/**
    The currently supported formats that can be converted
*/
enum GL_COLOR_CONVERT_FORMATS = "{ RGBA, RGB, RGBx, BGR, BGRx, BGRA, xRGB, xBGR, ARGB, ABGR, GBRA, GBR, RGBP, BGRP, Y444, I420, YV12, Y42B, Y41B, NV12, NV21, NV16, NV61, NV24, YUY2, UYVY, Y210, AYUV, VUYA, Y410, A444, A422, GRAY8, GRAY16_LE, GRAY16_BE, RGB16, BGR16, ARGB64, A420, AV12, NV12_16L32S, NV12_4L4, RBGA, v210";

/**
    The currently supported #GstCaps that can be converted
*/
enum GL_COLOR_CONVERT_VIDEO_CAPS = "video/x-raw(";

/**
    The canonical name of a #GstStructure that contains a configuration for a
    #GstGLContext.
*/
enum GL_CONFIG_STRUCTURE_NAME = "gst-gl-context-config";

/** */
enum GL_CONTEXT_TYPE_CGL = "gst.gl.context.CGL";

/** */
enum GL_CONTEXT_TYPE_EAGL = "gst.gl.context.EAGL";

/** */
enum GL_CONTEXT_TYPE_EGL = "gst.gl.context.EGL";

/** */
enum GL_CONTEXT_TYPE_GLX = "gst.gl.context.GLX";

/** */
enum GL_CONTEXT_TYPE_WGL = "gst.gl.context.WGL";

/**
    The name used in #GstContext queries for requesting a #GstGLDisplay
*/
enum GL_DISPLAY_CONTEXT_TYPE = "gst.gl.GLDisplay";

/**
    The name of the GL memory allocator
*/
enum GL_MEMORY_ALLOCATOR_NAME = "GLMemory";

/**
    The name of the GL Memory PBO allocator
*/
enum GL_MEMORY_PBO_ALLOCATOR_NAME = "GLMemoryPBO";

/** */
enum GL_MEMORY_VIDEO_EXT_FORMATS = ", RGBA64_LE, BGR10A2_LE, RGB10A2_LE, BGR10x2_LE, RGB10x2_LE, P010_10LE, P012_LE, P016_LE, Y212_LE, Y412_LE, A444_16LE, A422_16LE, A420_16LE, A444_12LE, A422_12LE, A420_12LE, A420_10LE, A422_10LE, A444_10LE, I420_12LE, I420_10LE, I422_10LE, I422_12LE, Y444_10LE, Y444_12LE, Y444_16LE";

/**
    List of video formats that are supported by #GstGLMemory
*/
enum GL_MEMORY_VIDEO_FORMATS_STR = "{ RGBA, BGRA, RGBx, BGRx, ARGB, ABGR, xRGB, xBGR, GBRA, GBR, RGBP, BGRP, RGB, BGR, RGB16, BGR16, AYUV, VUYA, A444, A422, Y410, I420, YV12, NV12, NV21, NV16, NV61, NV24, YUY2, UYVY, Y210, Y41B, Y42B, Y444, GRAY8, GRAY16_LE, GRAY16_BE, ARGB64, A420, AV12, NV12_16L32S, NV12_4L4, RBGA, v210";

/**
    The name of the GL renderbuffer allocator
*/
enum GL_RENDERBUFFER_ALLOCATOR_NAME = "GLRenderbuffer";

/**
    String used for [gid.gstgl1.types.GLTextureTarget._2d] in things like caps values
*/
enum GL_TEXTURE_TARGET_2D_STR = "2D";

/**
    String used for [gid.gstgl1.types.GLTextureTarget.ExternalOes] in things like caps values
*/
enum GL_TEXTURE_TARGET_EXTERNAL_OES_STR = "external-oes";

/**
    String used for [gid.gstgl1.types.GLTextureTarget.Rectangle] in things like caps values
*/
enum GL_TEXTURE_TARGET_RECTANGLE_STR = "rectangle";

/**
    Flag indicating that we should map the GL object instead of to system memory.
    
    Combining #GST_MAP_GL with #GST_MAP_WRITE has the same semantics as though
    you are writing to OpenGL. Conversely, combining #GST_MAP_GL with
    #GST_MAP_READ has the same semantics as though you are reading from OpenGL.
*/
enum MAP_GL = 131072;
