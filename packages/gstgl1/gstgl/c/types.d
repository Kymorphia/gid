/// C types for gstgl1 library
module gstgl.c.types;

public import gid.basictypes;
public import gst.c.types;
public import gstbase.c.types;
public import gstvideo.c.types;

/** */
enum GstGLAPI : uint
{
  /**
      no API
  */
  None = 0,

  /**
      Desktop OpenGL up to and including 3.1.  The
                         compatibility profile when the OpenGL version is >= 3.2
  */
  Opengl = 1,

  /**
      Desktop OpenGL >= 3.2 core profile
  */
  Opengl3 = 2,

  /**
      OpenGL ES 1.x
  */
  Gles1 = 32768,

  /**
      OpenGL ES 2.x and 3.x
  */
  Gles2 = 65536,

  /**
      Any OpenGL API
  */
  Any = 4294967295,
}

/** */
enum GstGLBaseMemoryError
{
  /**
      generic failure
  */
  Failed = 0,

  /**
      the implementation is too old and doesn't
                                          implement enough features
  */
  OldLibs = 1,

  /**
      a resource could not be found
  */
  ResourceUnavailable = 2,
}

/** */
enum GstGLBaseMemoryTransfer : uint
{
  /**
      the texture needs downloading
                                                  to the data pointer
  */
  Download = 1048576,

  /**
      the data pointer needs uploading
                                                  to the texture
  */
  Upload = 2097152,
}

/** */
enum GstGLConfigCaveat
{
  /**
      none
  */
  None = 0,

  /**
      slow
  */
  Slow = 1,

  /**
      non-conformant
  */
  NonConformant = 2,
}

/** */
enum GstGLConfigSurfaceType : uint
{
  /**
      none
  */
  None = 0,

  /**
      window
  */
  Window = 1,

  /**
      pbuffer
  */
  Pbuffer = 2,

  /**
      pixmap
  */
  Pixmap = 4,
}

/**
    OpenGL context errors.
*/
enum GstGLContextError
{
  /**
      Failed for an unspecified reason
  */
  Failed = 0,

  /**
      The configuration requested is not correct
  */
  WrongConfig = 1,

  /**
      The OpenGL API requested is not correct
  */
  WrongApi = 2,

  /**
      The OpenGL libraries are too old
  */
  OldLibs = 3,

  /**
      glXCreateContext (or similar) failed
  */
  CreateContext = 4,

  /**
      A resource is not available
  */
  ResourceUnavailable = 5,
}

/** */
enum GstGLDisplayType : uint
{
  /**
      no display type
  */
  None = 0,

  /**
      X11 display
  */
  X11 = 1,

  /**
      Wayland display
  */
  Wayland = 2,

  /**
      Cocoa display
  */
  Cocoa = 4,

  /**
      Win32 display
  */
  Win32 = 8,

  /**
      Dispmanx display
  */
  Dispmanx = 16,

  /**
      EGL display
  */
  Egl = 32,

  /**
      Vivante Framebuffer display
  */
  VivFb = 64,

  /**
      Mesa3D GBM display
  */
  Gbm = 128,

  /**
      EGLDevice display.
  */
  EglDevice = 256,

  /**
      EAGL display.
  */
  Eagl = 512,

  /**
      WinRT display.
  */
  Winrt = 1024,

  /**
      Android display.
  */
  Android = 2048,

  /**
      Mesa3D surfaceless display using the EGL_PLATFORM_SURFACELESS_MESA
      extension.
  */
  EglSurfaceless = 4096,

  /**
      any display type
  */
  Any = 4294967295,
}

/** */
enum GstGLFormat
{
  /**
      Single component replicated across R, G, and B textures
                         components
  */
  Luminance = 6409,

  /**
      Single component stored in the A texture component
  */
  Alpha = 6406,

  /**
      Combination of #GST_GL_LUMINANCE and #GST_GL_ALPHA
  */
  LuminanceAlpha = 6410,

  /**
      Single component stored in the R texture component
  */
  Red = 6403,

  /**
      Single 8-bit component stored in the R texture component
  */
  R8 = 33321,

  /**
      Two components stored in the R and G texture components
  */
  Rg = 33319,

  /**
      Two 8-bit components stored in the R and G texture components
  */
  Rg8 = 33323,

  /**
      Three components stored in the R, G, and B texture components
  */
  Rgb = 6407,

  /**
      Three 8-bit components stored in the R, G, and B
                    texture components
  */
  Rgb8 = 32849,

  /**
      Three components of bit depth 5, 6 and 5 stored in the R, G,
                      and B texture components respectively.
  */
  Rgb565 = 36194,

  /**
      Three 16-bit components stored in the R, G, and B
                    texture components
  */
  Rgb16 = 32852,

  /**
      Four components stored in the R, G, B, and A texture
                    components respectively.
  */
  Rgba = 6408,

  /**
      Four 8-bit components stored in the R, G, B, and A texture
                     components respectively.
  */
  Rgba8 = 32856,

  /**
      Four 16-bit components stored in the R, G, B, and A texture
                     components respectively.
  */
  Rgba16 = 32859,

  /**
      A single 16-bit component for depth information.
  */
  DepthComponent16 = 33189,

  /**
      A 24-bit component for depth information and
                                a 8-bit component for stencil informat.
  */
  Depth24Stencil8 = 35056,

  /** */
  Rgb10A2 = 32857,

  /**
      Single 16-bit component stored in the R texture component
  */
  R16 = 33322,

  /**
      Two 16-bit components stored in the R and G texture components
  */
  Rg16 = 33324,
}

/** */
enum GstGLPlatform : uint
{
  /**
      no platform
  */
  None = 0,

  /**
      the EGL platform used primarily with the X11, wayland
                           and android window systems as well as on embedded Linux
  */
  Egl = 1,

  /**
      the GLX platform used primarily with the X11 window system
  */
  Glx = 2,

  /**
      the WGL platform used primarily on Windows
  */
  Wgl = 4,

  /**
      the CGL platform used primarily on OS X
  */
  Cgl = 8,

  /**
      the EAGL platform used primarily on iOS
  */
  Eagl = 16,

  /**
      any OpenGL platform
  */
  Any = 4294967295,
}

/** */
enum GstGLQueryType
{
  /**
      no query
  */
  None = 0,

  /**
      query the time elapsed
  */
  TimeElapsed = 1,

  /**
      query the current time
  */
  Timestamp = 2,
}

/**
    Compilation stage that caused an error
*/
enum GstGLSLError
{
  /**
      Compilation error occurred
  */
  Compile = 0,

  /**
      Link error occurred
  */
  Link = 1,

  /**
      General program error occurred
  */
  Program = 2,
}

/**
    GLSL profiles
*/
enum GstGLSLProfile : uint
{
  /**
      no profile supported/available
  */
  None = 0,

  /**
      OpenGL|ES profile
  */
  Es = 1,

  /**
      OpenGL core profile
  */
  Core = 2,

  /**
      OpenGL compatibility profile
  */
  Compatibility = 4,

  /**
      any OpenGL/OpenGL|ES profile
  */
  Any = 4294967295,
}

/**
    GLSL version list
*/
enum GstGLSLVersion
{
  /**
      no version
  */
  None = 0,

  /**
      version 100 (only valid for ES)
  */
  _100 = 100,

  /**
      version 110 (only valid for compatibility desktop GL)
  */
  _110 = 110,

  /**
      version 120 (only valid for compatibility desktop GL)
  */
  _120 = 120,

  /**
      version 130 (only valid for compatibility desktop GL)
  */
  _130 = 130,

  /**
      version 140 (only valid for compatibility desktop GL)
  */
  _140 = 140,

  /**
      version 150 (valid for compatibility/core desktop GL)
  */
  _150 = 150,

  /**
      version 300 (only valid for ES)
  */
  _300 = 300,

  /**
      version 310 (only valid for ES)
  */
  _310 = 310,

  /**
      version 320 (only valid for ES)
  */
  _320 = 320,

  /**
      version 330 (valid for compatibility/core desktop GL)
  */
  _330 = 330,

  /**
      version 400 (valid for compatibility/core desktop GL)
  */
  _400 = 400,

  /**
      version 410 (valid for compatibility/core desktop GL)
  */
  _410 = 410,

  /**
      version 420 (valid for compatibility/core desktop GL)
  */
  _420 = 420,

  /**
      version 430 (valid for compatibility/core desktop GL)
  */
  _430 = 430,

  /**
      version 440 (valid for compatibility/core desktop GL)
  */
  _440 = 440,

  /**
      version 450 (valid for compatibility/core desktop GL)
  */
  _450 = 450,
}

/**
    Output anaglyph type to generate when downmixing to mono
*/
enum GstGLStereoDownmix
{
  /**
      Dubois optimised Green-Magenta anaglyph
  */
  GreenMagentaDubois = 0,

  /**
      Dubois optimised Red-Cyan anaglyph
  */
  RedCyanDubois = 1,

  /**
      Dubois optimised Amber-Blue anaglyph
  */
  AmberBlueDubois = 2,
}

/**
    The OpenGL texture target that an OpenGL texture can be bound to.  The
    [gstgl.global.glValueSetTextureTargetFromMask],
    [gstgl.global.glValueGetTextureTargetMask], and
    [gstgl.global.glValueSetTextureTarget] functions can be used for handling texture
    targets with #GValue's when e.g. dealing with #GstCaps.
*/
enum GstGLTextureTarget
{
  /**
      no texture target
  */
  None = 0,

  /**
      2D texture target (`GL_TEXTURE_2D`)
  */
  _2d = 1,

  /**
      rectangle texture target
          (`GL_TEXTURE_RECTANGLE`)
  */
  Rectangle = 2,

  /**
      external oes texture target
          (`GL_TEXTURE_EXTERNAL_OES`)
  */
  ExternalOes = 3,
}

/** */
enum GstGLUploadReturn
{
  /**
      No further processing required
  */
  Done = 1,

  /**
      An unspecified error occurred
  */
  Error = -1,

  /**
      The configuration is unsupported.
  */
  Unsupported = -2,

  /**
      This element requires a reconfiguration.
  */
  Reconfigure = -3,

  /**
      private return value.
  */
  UnsharedGlContext = -100,
}

/** */
enum GstGLWindowError
{
  /**
      failed for a unspecified reason
  */
  Failed = 0,

  /**
      the implementation is too old
  */
  OldLibs = 1,

  /**
      no such resource was found
  */
  ResourceUnavailable = 2,
}

/** */
struct GstGLAllocationParams
{
  /**
      the size of the struct (including and subclass data)
  */
  size_t structSize;

  /**
      a #GstGLAllocationParamsCopyFunc
  */
  GstGLAllocationParamsCopyFunc copy;

  /**
      a #GstGLAllocationParamsFreeFunc
  */
  GstGLAllocationParamsFreeFunc free;

  /**
      allocation flags
  */
  uint allocFlags;

  /**
      the allocation size
  */
  size_t allocSize;

  /**
      the #GstAllocationParams
  */
  GstAllocationParams* allocParams;

  /**
      a #GstGLContext
  */
  GstGLContext* context;

  /**
      a #GDestroyNotify
  */
  GDestroyNotify notify;

  /**
      argument to call @notify with
  */
  void* userData;

  /**
      the wrapped data pointer
  */
  void* wrappedData;

  /**
      the wrapped OpenGL handle
  */
  void* glHandle;

  /** */
  void*[4] Padding;
}

/**
    #GstGLAsyncDebug an opaque structure and should only be accessed through the
    provided API.
*/
struct GstGLAsyncDebug
{
  /** */
  uint stateFlags;

  /** */
  GstDebugCategory* cat;

  /** */
  GstDebugLevel level;

  /** */
  const(char)* file;

  /** */
  const(char)* function_;

  /** */
  int line;

  /** */
  GObject* object;

  /** */
  char* debugMsg;

  /** */
  GstGLAsyncDebugLogGetMessage callback;

  /** */
  void* userData;

  /** */
  GDestroyNotify notify;

  /** */
  void*[4] Padding;
}

/**
    #GstGLBaseFilter handles the nitty gritty details of retrieving an OpenGL
    context.  It also provided some wrappers around #GstBaseTransform's
    `start()`, `stop()` and `set_caps()` virtual methods that ensure an OpenGL
    context is available and current in the calling thread.
*/
struct GstGLBaseFilter
{
  /** */
  GstBaseTransform parent;

  /**
      the currently configured #GstGLDisplay
  */
  GstGLDisplay* display;

  /**
      the currently configured #GstGLContext
  */
  GstGLContext* context;

  /**
      the currently configured input #GstCaps
  */
  GstCaps* inCaps;

  /**
      the currently configured output #GstCaps
  */
  GstCaps* outCaps;

  /** */
  void*[4] Padding;

  /** */
  GstGLBaseFilterPrivate* priv;
}

/**
    The base class for GStreamer GL Filter.
*/
struct GstGLBaseFilterClass
{
  /** */
  GstBaseTransformClass parentClass;

  /**
      the logical-OR of #GstGLAPI's supported by this element
  */
  GstGLAPI supportedGlApi;

  /**
      called in the GL thread to setup the element GL state.
  */
  extern(C) gboolean function(GstGLBaseFilter* filter) glStart;

  /**
      called in the GL thread to setup the element GL state.
  */
  extern(C) void function(GstGLBaseFilter* filter) glStop;

  /**
      called in the GL thread when caps are set on @filter.
                    Note: this will also be called when changing OpenGL contexts
                    where #GstBaseTransform::set_caps may not.
  */
  extern(C) gboolean function(GstGLBaseFilter* filter, GstCaps* incaps, GstCaps* outcaps) glSetCaps;

  /** */
  void*[4] Padding;
}

/** */
struct GstGLBaseFilterPrivate;

/**
    GstGLBaseMemory is a #GstMemory subclass providing the basis of support
    for the mapping of GL buffers.
    
    Data is uploaded or downloaded from the GPU as is necessary.
*/
struct GstGLBaseMemory
{
  /**
      the parent object
  */
  GstMemory mem;

  /**
      the #GstGLContext to use for GL operations
  */
  GstGLContext* context;

  /** */
  GMutex lock;

  /** */
  GstMapFlags mapFlags;

  /** */
  int mapCount;

  /** */
  int glMapCount;

  /** */
  void* data;

  /** */
  GstGLQuery* query;

  /** */
  size_t allocSize;

  /** */
  void* allocData;

  /** */
  GDestroyNotify notify;

  /** */
  void* userData;

  /** */
  void*[4] Padding;
}

/**
    Opaque #GstGLBaseMemoryAllocator struct
*/
struct GstGLBaseMemoryAllocator
{
  /** */
  GstAllocator parent;

  /** */
  GstMemoryCopyFunction fallbackMemCopy;

  /** */
  void*[4] Padding;
}

/** */
struct GstGLBaseMemoryAllocatorClass
{
  /**
      the parent class
  */
  GstAllocatorClass parentClass;

  /**
      a #GstGLBaseMemoryAllocatorAllocFunction
  */
  GstGLBaseMemoryAllocatorAllocFunction alloc;

  /**
      a #GstGLBaseMemoryAllocatorCreateFunction
  */
  GstGLBaseMemoryAllocatorCreateFunction create;

  /**
      a #GstGLBaseMemoryAllocatorMapFunction
  */
  GstGLBaseMemoryAllocatorMapFunction map;

  /**
      a #GstGLBaseMemoryAllocatorUnmapFunction
  */
  GstGLBaseMemoryAllocatorUnmapFunction unmap;

  /**
      a #GstGLBaseMemoryAllocatorCopyFunction
  */
  GstGLBaseMemoryAllocatorCopyFunction copy;

  /**
      a #GstGLBaseMemoryAllocatorDestroyFunction
  */
  GstGLBaseMemoryAllocatorDestroyFunction destroy;

  /** */
  void*[4] Padding;
}

/**
    #GstGLBaseMixer handles the nitty gritty details of retrieving an OpenGL
    context.  It provides some virtual methods to know when the OpenGL context
    is available and is not available within this element.
*/
struct GstGLBaseMixer
{
  /**
      parent #GstVideoAggregator
  */
  GstVideoAggregator parent;

  /**
      the currently configured #GstGLDisplay
  */
  GstGLDisplay* display;

  /**
      the currently configured #GstGLContext
  */
  GstGLContext* context;

  /** */
  void*[4] Padding;

  /** */
  GstGLBaseMixerPrivate* priv;
}

/** */
struct GstGLBaseMixerClass
{
  /**
      the parent #GstVideoAggregatorClass
  */
  GstVideoAggregatorClass parentClass;

  /**
      the logical-OR of #GstGLAPI's supported by this element
  */
  GstGLAPI supportedGlApi;

  /** */
  extern(C) gboolean function(GstGLBaseMixer* mix) glStart;

  /** */
  extern(C) void function(GstGLBaseMixer* mix) glStop;

  /** */
  void*[4] Padding;
}

/** */
struct GstGLBaseMixerPad
{
  /**
      parent #GstVideoAggregatorPad
  */
  GstVideoAggregatorPad parent;

  /** */
  void*[4] Padding;
}

/** */
struct GstGLBaseMixerPadClass
{
  /**
      parent #GstVideoAggregatorPadClass
  */
  GstVideoAggregatorPadClass parentClass;

  /** */
  void*[4] Padding;
}

/** */
struct GstGLBaseMixerPrivate;

/**
    #GstGLBaseSrc handles the nitty gritty details of retrieving an OpenGL
    context. It also provided some wrappers around #GstBaseSrc's `start()` and
    `stop()` virtual methods that ensure an OpenGL context is available and
    current in the calling thread.
*/
struct GstGLBaseSrc
{
  /** */
  GstPushSrc parent;

  /**
      the currently configured #GstGLDisplay
  */
  GstGLDisplay* display;

  /**
      the currently configured #GstGLContext
  */
  GstGLContext* context;

  /**
      the currently configured output #GstVideoInfo
  */
  GstVideoInfo outInfo;

  /**
      the currently configured output #GstCaps
  */
  GstCaps* outCaps;

  /**
      the total running time
  */
  GstClockTime runningTime;

  /** */
  void*[4] Padding;

  /** */
  GstGLBaseSrcPrivate* priv;
}

/**
    The base class for GStreamer GL Video sources.
*/
struct GstGLBaseSrcClass
{
  /** */
  GstPushSrcClass parentClass;

  /**
      the logical-OR of #GstGLAPI's supported by this element
  */
  GstGLAPI supportedGlApi;

  /**
      called in the GL thread to setup the element GL state.
  */
  extern(C) gboolean function(GstGLBaseSrc* src) glStart;

  /**
      called in the GL thread to setup the element GL state.
  */
  extern(C) void function(GstGLBaseSrc* src) glStop;

  /**
      called in the GL thread to fill the current video texture.
  */
  extern(C) gboolean function(GstGLBaseSrc* src, GstGLMemory* mem) fillGlMemory;

  /** */
  void*[4] Padding;
}

/** */
struct GstGLBaseSrcPrivate;

/**
    GstGLBuffer is a #GstMemory subclass providing support for the mapping of
    GL buffers.
    
    Data is uploaded or downloaded from the GPU as is necessary.
*/
struct GstGLBuffer
{
  /**
      the parent object
  */
  GstGLBaseMemory mem;

  /**
      the buffer id for this memory
  */
  uint id;

  /**
      the OpenGL target of this texture for binding purposes
  */
  uint target;

  /**
      the OpenGL usage hints this buffer was created with
  */
  uint usageHints;
}

/** */
struct GstGLBufferAllocationParams
{
  /**
      parent object
  */
  GstGLAllocationParams parent;

  /**
      the OpenGL target to bind the buffer to
  */
  uint glTarget;

  /**
      the OpenGL usage hint to create the buffer with
  */
  uint glUsage;

  /** */
  void*[4] Padding;
}

/**
    Opaque #GstGLBufferAllocator struct
*/
struct GstGLBufferAllocator
{
  /** */
  GstGLBaseMemoryAllocator parent;

  /** */
  void*[4] Padding;
}

/**
    The #GstGLBufferAllocatorClass only contains private data
*/
struct GstGLBufferAllocatorClass
{
  /** */
  GstGLBaseMemoryAllocatorClass parentClass;

  /** */
  void*[4] Padding;
}

/**
    a #GstGLBufferPool is an object that allocates buffers with #GstGLBaseMemory
    
    A #GstGLBufferPool is created with [gstgl.glbuffer_pool.GLBufferPool.new_]
    
    #GstGLBufferPool implements the VideoMeta buffer pool option
    `GST_BUFFER_POOL_OPTION_VIDEO_META`, the VideoAligment buffer pool option
    `GST_BUFFER_POOL_OPTION_VIDEO_ALIGNMENT` as well as the OpenGL specific
    `GST_BUFFER_POOL_OPTION_GL_SYNC_META` buffer pool option.
*/
struct GstGLBufferPool
{
  /** */
  GstBufferPool bufferpool;

  /** */
  GstGLContext* context;

  /** */
  GstGLBufferPoolPrivate* priv;

  /** */
  void*[4] Padding;
}

/**
    The #GstGLBufferPoolClass structure contains only private data
*/
struct GstGLBufferPoolClass
{
  /** */
  GstBufferPoolClass parentClass;

  /** */
  void*[4] Padding;
}

/** */
struct GstGLBufferPoolPrivate;

/**
    #GstGLColorConvert is an object that converts between color spaces and/or
    formats using OpenGL Shaders.
    
    A #GstGLColorConvert can be created with [gstgl.glcolor_convert.GLColorConvert.new_], the
    configuration negotiated with [gstgl.glcolor_convert.GLColorConvert.transformCaps] and the
    conversion performed with [gstgl.glcolor_convert.GLColorConvert.perform].
    
    The glcolorconvertelement provides a GStreamer element that uses
    #GstGLColorConvert to convert between video formats and color spaces.
*/
struct GstGLColorConvert
{
  /** */
  GstObject parent;

  /** */
  GstGLContext* context;

  /** */
  GstVideoInfo inInfo;

  /** */
  GstVideoInfo outInfo;

  /** */
  gboolean initted;

  /** */
  gboolean passthrough;

  /** */
  GstBuffer* inbuf;

  /** */
  GstBuffer* outbuf;

  /** */
  GstGLFramebuffer* fbo;

  /** */
  GstGLShader* shader;

  /** */
  GstGLColorConvertPrivate* priv;

  /** */
  void*[4] Reserved;
}

/**
    The #GstGLColorConvertClass struct only contains private data
*/
struct GstGLColorConvertClass
{
  /** */
  GstObjectClass objectClass;

  /** */
  void*[4] Padding;
}

/** */
struct GstGLColorConvertPrivate;

/**
    #GstGLContext wraps an OpenGL context object in a uniform API.  As a result
    of the limitation on OpenGL context, this object is not thread safe unless
    specified and must only be activated in a single thread.
    
    Environment variables:
    $(LIST
      * `GST_GL_API`: select which OpenGL API to create and OpenGL context for.
                      Depending on the platform, the available values are
                      'opengl', 'opengl3' (core profile), and 'gles2'.  See the
                      the #GstGLAPI enumeration for more details.
      * `GST_GL_PLATFORM`: select which OpenGL platform to create an OpenGL
                           context with.  Depending on the platform and the
                           dependencies available build-time, the available values
                           are, 'glx', 'egl', 'cgl', 'wgl', and 'eagl'
      * `GST_GL_CONFIG`: select the configuration used for creating the OpenGL
                         context and OpenGL surface.  Written out as a GstStructure
                         that has been serialized to string.  e.g.
                         `GST_GL_CONFIG="gst-gl-context-config,red-size=8,green-size=8,blue-size=8,alpha-size=8,depth-size=16"`.
                         Not all platforms will support the same level of
                         functionality.
    )
*/
struct GstGLContext
{
  /** */
  GstObject parent;

  /** */
  GstGLDisplay* display;

  /** */
  GstGLWindow* window;

  /**
      a list of OpenGL function pointers
  */
  GstGLFuncs* glVtable;

  /** */
  GstGLContextPrivate* priv;

  /** */
  void*[4] Reserved;
}

/** */
struct GstGLContextClass
{
  /** */
  GstObjectClass parentClass;

  /** */
  extern(C) size_t function() getCurrentContext;

  /**
      get the backing platform specific OpenGL context
  */
  extern(C) size_t function(GstGLContext* context) getGlContext;

  /**
      get the available OpenGL api's that this context can work with
  */
  extern(C) GstGLAPI function(GstGLContext* context) getGlApi;

  /** */
  extern(C) GstGLPlatform function(GstGLContext* context) getGlPlatform;

  /**
      get an function pointer to an OpenGL function
  */
  extern(C) void* function(GstGLAPI glApi, const(char)* name) getProcAddress;

  /**
      call eglMakeCurrent or similar
  */
  extern(C) gboolean function(GstGLContext* context, gboolean activate) activate;

  /**
      choose a format for the framebuffer
  */
  extern(C) gboolean function(GstGLContext* context, GError** _err) chooseFormat;

  /**
      create the OpenGL context
  */
  extern(C) gboolean function(GstGLContext* context, GstGLAPI glApi, GstGLContext* otherContext, GError** _err) createContext;

  /**
      destroy the OpenGL context
  */
  extern(C) void function(GstGLContext* context) destroyContext;

  /**
      swap the default framebuffer's front/back buffers
  */
  extern(C) void function(GstGLContext* context) swapBuffers;

  /** */
  extern(C) gboolean function(GstGLContext* context, const(char)* feature) checkFeature;

  /** */
  extern(C) void function(GstGLContext* context, int* major, int* minor) getGlPlatformVersion;

  /** */
  extern(C) GstStructure* function(GstGLContext* context) getConfig;

  /** */
  extern(C) gboolean function(GstGLContext* context, GstStructure* glConfig) requestConfig;

  /** */
  void*[2] Reserved;
}

/** */
struct GstGLContextPrivate;

/**
    #GstGLDisplay represents a connection to the underlying windowing system.
    Elements are required to make use of #GstContext to share and propagate
    a #GstGLDisplay.
    
    There are a number of environment variables that influence the choice of
    platform and window system specific functionality.
    $(LIST
      * GST_GL_WINDOW influences the window system to use.  Common values are
        'x11', 'wayland', 'surfaceless', 'win32' or 'cocoa'.
      * GST_GL_PLATFORM influences the OpenGL platform to use.  Common values are
        'egl', 'glx', 'wgl' or 'cgl'.
      * GST_GL_API influences the OpenGL API requested by the OpenGL platform.
        Common values are 'opengl', 'opengl3' and 'gles2'.
    )
      
    > Certain window systems require a special function to be called to
    > initialize threading support.  As this GStreamer GL library does not preclude
    > concurrent access to the windowing system, it is strongly advised that
    > applications ensure that threading support has been initialized before any
    > other toolkit/library functionality is accessed.  Failure to do so could
    > result in sudden application abortion during execution.  The most notably
    > example of such a function is X11's XInitThreads\().
*/
struct GstGLDisplay
{
  /** */
  GstObject object;

  /** */
  GstGLDisplayType type;

  /** */
  GList* windows;

  /** */
  GMainContext* mainContext;

  /** */
  GMainLoop* mainLoop;

  /** */
  GSource* eventSource;

  /** */
  GstGLDisplayPrivate* priv;
}

/** */
struct GstGLDisplayClass
{
  /** */
  GstObjectClass objectClass;

  /** */
  extern(C) size_t function(GstGLDisplay* display) getHandle;

  /** */
  extern(C) GstGLWindow* function(GstGLDisplay* display) createWindow;

  /** */
  void*[4] Padding;
}

/** */
struct GstGLDisplayPrivate;

/**
    #GstGLFilter helps to implement simple OpenGL filter elements taking a
    single input and producing a single output with a #GstGLFramebuffer
*/
struct GstGLFilter
{
  /** */
  GstGLBaseFilter parent;

  /**
      the video info for input buffers
  */
  GstVideoInfo inInfo;

  /**
      the video info for output buffers
  */
  GstVideoInfo outInfo;

  /**
      The texture target of the input buffers (usually 2D)
  */
  GstGLTextureTarget inTextureTarget;

  /**
      The texture target of the output buffers (usually 2D)
  */
  GstGLTextureTarget outTextureTarget;

  /**
      the output #GstCaps
  */
  GstCaps* outCaps;

  /**
      #GstGLFramebuffer object used for transformations (only for subclass usage)
  */
  GstGLFramebuffer* fbo;

  /** */
  gboolean glResult;

  /** */
  GstBuffer* inbuf;

  /** */
  GstBuffer* outbuf;

  /** */
  GstGLShader* defaultShader;

  /** */
  gboolean validAttributes;

  /** */
  uint vao;

  /** */
  uint vboIndices;

  /** */
  uint vertexBuffer;

  /** */
  int drawAttrPositionLoc;

  /** */
  int drawAttrTextureLoc;

  /** */
  void*[4] Padding;
}

/** */
struct GstGLFilterClass
{
  /** */
  GstGLBaseFilterClass parentClass;

  /**
      mirror from #GstBaseTransform
  */
  extern(C) gboolean function(GstGLFilter* filter, GstCaps* incaps, GstCaps* outcaps) setCaps;

  /**
      perform operations on the input and output buffers.  In general,
               you should avoid using this method if at all possible. One valid
               use-case for using this is keeping previous buffers for future calculations.
               Note: If @filter exists, then @filter_texture is not run
  */
  extern(C) gboolean function(GstGLFilter* filter, GstBuffer* inbuf, GstBuffer* outbuf) filter;

  /**
      given @in_tex, transform it into @out_tex.  Not used
                       if @filter exists
  */
  extern(C) gboolean function(GstGLFilter* filter, GstGLMemory* input, GstGLMemory* output) filterTexture;

  /**
      perform initialization when the Framebuffer object is created
  */
  extern(C) gboolean function(GstGLFilter* filter) initFbo;

  /**
      Perform sub-class specific modifications of the
        caps to be processed between upload on input and before download for output.
  */
  extern(C) GstCaps* function(GstGLFilter* filter, GstPadDirection direction, GstCaps* caps, GstCaps* filterCaps) transformInternalCaps;

  /** */
  void*[4] Padding;
}

/**
    A #GstGLFramebuffer represents and holds an OpenGL framebuffer object with
    it's associated attachments.
    
    A #GstGLFramebuffer can be created with [gstgl.glframebuffer.GLFramebuffer.new_] or
    [gstgl.glframebuffer.GLFramebuffer.newWithDefaultDepth] and bound with
    [gstgl.glframebuffer.GLFramebuffer.bind].  Other resources can be bound with
    [gstgl.glframebuffer.GLFramebuffer.attach]
    
    Note: OpenGL framebuffers are not shareable resources so cannot be used
    between multiple OpenGL contexts.
*/
struct GstGLFramebuffer
{
  /** */
  GstObject object;

  /** */
  GstGLContext* context;

  /** */
  uint fboId;

  /** */
  GArray* attachments;

  /** */
  void*[4] Padding;

  /** */
  GstGLFramebufferPrivate* priv;
}

/**
    Opaque #GstGLFramebufferClass struct
*/
struct GstGLFramebufferClass
{
  /** */
  GstObjectClass objectClass;

  /** */
  void*[4] Padding;
}

/** */
struct GstGLFramebufferPrivate;

/**
    Structure containing function pointers to OpenGL functions.
    
    Each field is named exactly the same as the OpenGL function without the
    `gl` prefix.
*/
struct GstGLFuncs;

/**
    GstGLMemory is a #GstGLBaseMemory subclass providing support for the mapping of
    OpenGL textures.
    
    #GstGLMemory is created or wrapped through [gstgl.glbase_memory.GLBaseMemory.alloc]
    with #GstGLVideoAllocationParams.
    
    Data is uploaded or downloaded from the GPU as is necessary.
    
    The #GstCaps that is used for #GstGLMemory based buffers should contain
    the `GST_CAPS_FEATURE_MEMORY_GL_MEMORY` as a #GstCapsFeatures and should
    contain a 'texture-target' field with one of the #GstGLTextureTarget values
    as a string, i.e. some combination of 'texture-target=(string){2D,
    rectangle, external-oes}'.
*/
struct GstGLMemory
{
  /**
      the parent #GstGLBaseMemory object
  */
  GstGLBaseMemory mem;

  /**
      the GL texture id for this memory
  */
  uint texId;

  /**
      the GL texture target for this memory
  */
  GstGLTextureTarget texTarget;

  /**
      the texture type
  */
  GstGLFormat texFormat;

  /**
      the texture's #GstVideoInfo
  */
  GstVideoInfo info;

  /**
      data alignment for system memory mapping
  */
  GstVideoAlignment valign;

  /**
      data plane in @info
  */
  uint plane;

  /**
      GL shader scaling parameters for @valign and/or width/height
  */
  float[2] texScaling;

  /** */
  gboolean textureWrapped;

  /** */
  uint unpackLength;

  /** */
  uint texWidth;

  /** */
  void*[4] Padding;
}

/**
    Opaque #GstGLMemoryAllocator struct
*/
struct GstGLMemoryAllocator
{
  /** */
  GstGLBaseMemoryAllocator parent;

  /** */
  void*[4] Padding;
}

/** */
struct GstGLMemoryAllocatorClass
{
  /** */
  GstGLBaseMemoryAllocatorClass parentClass;

  /**
      provide a custom map implementation
  */
  GstGLBaseMemoryAllocatorMapFunction map;

  /**
      provide a custom copy implementation
  */
  GstGLBaseMemoryAllocatorCopyFunction copy;

  /**
      provide a custom unmap implementation
  */
  GstGLBaseMemoryAllocatorUnmapFunction unmap;

  /** */
  void*[4] Padding;
}

/**
    #GstGLMemoryPBO is created or wrapped through [gstgl.glbase_memory.GLBaseMemory.alloc]
    with #GstGLVideoAllocationParams.
    
    Data is uploaded or downloaded from the GPU as is necessary.
*/
struct GstGLMemoryPBO
{
  /** */
  GstGLMemory mem;

  /** */
  GstGLBuffer* pbo;

  /** */
  void*[4] Padding;
}

/**
    Opaque #GstGLMemoryPBOAllocator struct
*/
struct GstGLMemoryPBOAllocator
{
  /** */
  GstGLMemoryAllocator parent;

  /** */
  void*[4] Padding;
}

/**
    Only contains private data
*/
struct GstGLMemoryPBOAllocatorClass
{
  /** */
  GstGLMemoryAllocatorClass parentClass;

  /** */
  void*[4] Padding;
}

/**
    #GstGLMixer helps implement an element that operates on RGBA textures.
*/
struct GstGLMixer
{
  /** */
  GstGLBaseMixer parent;

  /**
      the configured output #GstCaps
  */
  GstCaps* outCaps;

  /** */
  GstGLMixerPrivate* priv;

  /** */
  void*[4] Padding;
}

/** */
struct GstGLMixerClass
{
  /** */
  GstGLBaseMixerClass parentClass;

  /** */
  extern(C) gboolean function(GstGLMixer* mix, GstBuffer* outbuf) processBuffers;

  /** */
  extern(C) gboolean function(GstGLMixer* mix, GstGLMemory* outTex) processTextures;

  /** */
  void*[4] Padding;
}

/** */
struct GstGLMixerPad
{
  /**
      parent #GstGLBaseMixerPad
  */
  GstGLBaseMixerPad parent;

  /**
      the current input texture for this pad
  */
  uint currentTexture;

  /** */
  void*[4] Padding;
}

/** */
struct GstGLMixerPadClass
{
  /**
      parent #GstGLBaseMixerPadClass
  */
  GstGLBaseMixerPadClass parentClass;

  /** */
  void*[4] Padding;
}

/** */
struct GstGLMixerPrivate;

/**
    Opaque #GstGLOverlayCompositor object
*/
struct GstGLOverlayCompositor
{
  /** */
  GstObject parent;

  /** */
  GstGLContext* context;

  /** */
  uint lastWindowWidth;

  /** */
  uint lastWindowHeight;

  /** */
  GList* overlays;

  /** */
  GstGLShader* shader;

  /** */
  int positionAttrib;

  /** */
  int texcoordAttrib;

  /** */
  void*[4] Padding;
}

/** */
struct GstGLOverlayCompositorClass
{
  /** */
  GstObjectClass objectClass;

  /** */
  void*[4] Padding;
}

/**
    A #GstGLQuery represents and holds an OpenGL query object.  Various types of
    queries can be run or counters retrieved.
*/
struct GstGLQuery
{
  /** */
  GstGLContext* context;

  /** */
  uint queryType;

  /** */
  uint queryId;

  /** */
  gboolean supported;

  /** */
  gboolean startCalled;

  /** */
  GstGLAsyncDebug debug_;

  /** */
  void*[4] Padding;
}

/**
    GstGLRenderbuffer is a #GstGLBaseMemory subclass providing support for
    OpenGL renderbuffers.
    
    #GstGLRenderbuffer is created or wrapped through [gstgl.glbase_memory.GLBaseMemory.alloc]
    with #GstGLRenderbufferAllocationParams.
*/
struct GstGLRenderbuffer
{
  /** */
  GstGLBaseMemory mem;

  /**
      the GL texture id for this memory
  */
  uint renderbufferId;

  /**
      the texture type
  */
  GstGLFormat renderbufferFormat;

  /**
      the width
  */
  uint width;

  /**
      the height
  */
  uint height;

  /** */
  gboolean renderbufferWrapped;

  /** */
  void*[4] Padding;
}

/**
    Allocation parameters
*/
struct GstGLRenderbufferAllocationParams
{
  /** */
  GstGLAllocationParams parent;

  /**
      the #GstGLFormat
  */
  GstGLFormat renderbufferFormat;

  /**
      the width
  */
  uint width;

  /**
      the height
  */
  uint height;

  /** */
  void*[4] Padding;
}

/**
    Opaque #GstGLRenderbufferAllocator struct
*/
struct GstGLRenderbufferAllocator
{
  /** */
  GstGLBaseMemoryAllocator parent;

  /** */
  void*[4] Padding;
}

/**
    The #GstGLRenderbufferAllocatorClass only contains private data
*/
struct GstGLRenderbufferAllocatorClass
{
  /** */
  GstGLBaseMemoryAllocatorClass parentClass;

  /** */
  void*[4] Padding;
}

/**
    #GstGLSLStage holds and represents a single OpenGL shader stage.
*/
struct GstGLSLStage
{
  /** */
  GstObject parent;

  /** */
  GstGLContext* context;

  /** */
  GstGLSLStagePrivate* priv;

  /** */
  void*[4] Padding;
}

/**
    Opaque #GstGLSLStageClass struct
*/
struct GstGLSLStageClass
{
  /** */
  GstObjectClass parent;

  /** */
  void*[4] Padding;
}

/** */
struct GstGLSLStagePrivate;

/** */
struct GstGLShader
{
  /** */
  GstObject parent;

  /** */
  GstGLContext* context;

  /** */
  GstGLShaderPrivate* priv;

  /** */
  void*[4] Padding;
}

/** */
struct GstGLShaderClass
{
  /** */
  GstObjectClass parentClass;
}

/** */
struct GstGLShaderPrivate;

/**
    #GstGLSyncMeta provides the ability to synchronize the OpenGL command stream
    with the CPU or with other OpenGL contexts.
*/
struct GstGLSyncMeta
{
  /**
      the parent #GstMeta
  */
  GstMeta parent;

  /**
      the #GstGLContext used to allocate the meta
  */
  GstGLContext* context;

  /**
      a custom data pointer for the implementation
  */
  void* data;

  /**
      set a sync point in the OpenGL command stream
  */
  extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context) setSync;

  /**
      the same as @set_sync but called from @context's thread
  */
  extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context) setSyncGl;

  /**
      execute a wait on the previously set sync point into the OpenGL command stream
  */
  extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context) wait;

  /**
      the same as @wait but called from @context's thread
  */
  extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context) waitGl;

  /**
      wait for the previously set sync point to pass from the CPU
  */
  extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context) waitCpu;

  /**
      the same as @wait_cpu but called from @context's thread
  */
  extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context) waitCpuGl;

  /**
      copy @data into a new #GstGLSyncMeta
  */
  extern(C) void function(GstGLSyncMeta* src, GstBuffer* sbuffer, GstGLSyncMeta* dest, GstBuffer* dbuffer) copy;

  /**
      free @data
  */
  extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context) free;

  /**
      free @data in @context's thread
  */
  extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context) freeGl;
}

/**
    #GstGLUpload is an object that uploads data from system memory into GL textures.
    
    A #GstGLUpload can be created with [gstgl.glupload.GLUpload.new_]
*/
struct GstGLUpload
{
  /** */
  GstObject parent;

  /** */
  GstGLContext* context;

  /** */
  GstGLUploadPrivate* priv;

  /** */
  void*[4] Reserved;
}

/**
    The #GstGLUploadClass struct only contains private data
*/
struct GstGLUploadClass
{
  /** */
  GstObjectClass objectClass;

  /** */
  void*[4] Padding;
}

/** */
struct GstGLUploadPrivate;

/** */
struct GstGLVideoAllocationParams
{
  /**
      the parent #GstGLAllocationParams structure
  */
  GstGLAllocationParams parent;

  /**
      the #GstVideoInfo to allocate
  */
  GstVideoInfo* vInfo;

  /**
      the video plane index to allocate
  */
  uint plane;

  /**
      the #GstVideoAlignment to align the system representation to (may be null for the default)
  */
  GstVideoAlignment* valign;

  /**
      the #GstGLTextureTarget to allocate
  */
  GstGLTextureTarget target;

  /**
      the #GstGLFormat to allocate
  */
  GstGLFormat texFormat;

  /** */
  void*[4] Padding;
}

/**
    Convert stereoscopic/multiview video using fragment shaders.
*/
struct GstGLViewConvert
{
  /** */
  GstObject object;

  /** */
  GstGLContext* context;

  /** */
  GstGLShader* shader;

  /** */
  GstVideoMultiviewMode inputModeOverride;

  /** */
  GstVideoMultiviewFlags inputFlagsOverride;

  /** */
  GstVideoMultiviewMode outputModeOverride;

  /** */
  GstVideoMultiviewFlags outputFlagsOverride;

  /** */
  GstGLStereoDownmix downmixMode;

  /** */
  GstVideoInfo inInfo;

  /** */
  GstVideoInfo outInfo;

  /** */
  GstGLTextureTarget fromTextureTarget;

  /** */
  GstGLTextureTarget toTextureTarget;

  /** */
  gboolean capsPassthrough;

  /** */
  gboolean initted;

  /** */
  gboolean reconfigure;

  /** */
  GstGLFramebuffer* fbo;

  /** */
  GstGLViewConvertPrivate* priv;

  /** */
  void*[4] Padding;
}

/**
    Opaque #GstGLViewConvertClass struct
*/
struct GstGLViewConvertClass
{
  /** */
  GstObjectClass objectClass;

  /** */
  void*[4] Padding;
}

/** */
struct GstGLViewConvertPrivate;

/**
    GstGLWindow represents a window that elements can render into.  A window can
    either be a user visible window (onscreen) or hidden (offscreen).
*/
struct GstGLWindow
{
  /** */
  GstObject parent;

  /** */
  GMutex lock;

  /** */
  GstGLDisplay* display;

  /** */
  GWeakRef contextRef;

  /** */
  gboolean isDrawing;

  /** */
  GstGLWindowCB draw;

  /** */
  void* drawData;

  /** */
  GDestroyNotify drawNotify;

  /** */
  GstGLWindowCB close;

  /** */
  void* closeData;

  /** */
  GDestroyNotify closeNotify;

  /** */
  GstGLWindowResizeCB resize;

  /** */
  void* resizeData;

  /** */
  GDestroyNotify resizeNotify;

  /** */
  gboolean queueResize;

  /** */
  GMainContext* mainContext;

  /** */
  GstGLWindowPrivate* priv;

  /** */
  void*[4] Reserved;
}

/** */
struct GstGLWindowClass
{
  /**
      Parent class
  */
  GstObjectClass parentClass;

  /**
      Gets the current windowing system display connection
  */
  extern(C) size_t function(GstGLWindow* window) getDisplay;

  /**
      Set a window handle to render into
  */
  extern(C) void function(GstGLWindow* window, size_t handle) setWindowHandle;

  /**
      Gets the current window handle that this #GstGLWindow is
                          rendering into.  This may return a different value to
                          what is passed into @set_window_handle
  */
  extern(C) size_t function(GstGLWindow* window) getWindowHandle;

  /**
      redraw the window with the specified dimensions
  */
  extern(C) void function(GstGLWindow* window) draw;

  /**
      run the mainloop
  */
  extern(C) void function(GstGLWindow* window) run;

  /**
      send a quit to the mainloop
  */
  extern(C) void function(GstGLWindow* window) quit;

  /**
      invoke a function on the window thread.  Required to be reentrant.
  */
  extern(C) void function(GstGLWindow* window, GstGLWindowCB callback, void* data) sendMessage;

  /**
      invoke a function on the window thread. @run may or may
                           not have been called.  Required to be reentrant.
  */
  extern(C) void function(GstGLWindow* window, GstGLWindowCB callback, void* data, GDestroyNotify destroy) sendMessageAsync;

  /**
      open the connection to the display
  */
  extern(C) gboolean function(GstGLWindow* window, GError** _err) open;

  /**
      close the connection to the display
  */
  extern(C) void function(GstGLWindow* window) close;

  /**
      whether to handle 'extra' events from the windowing system.
                      Basic events like surface moves and resizes are still valid
                      things to listen for.
  */
  extern(C) void function(GstGLWindow* window, gboolean handleEvents) handleEvents;

  /**
      request that the window change surface size.  The
                           implementation is free to ignore this information.
  */
  extern(C) void function(GstGLWindow* window, int width, int height) setPreferredSize;

  /**
      request that the window be shown to the user
  */
  extern(C) void function(GstGLWindow* window) show;

  /**
      request a rectangle to render into.  See #GstVideoOverlay
  */
  extern(C) gboolean function(GstGLWindow* window, int x, int y, int width, int height) setRenderRectangle;

  /**
      request a resize to occur when possible
  */
  extern(C) void function(GstGLWindow* window) queueResize;

  /**
      Whether the window takes care of glViewport setup.
                          and the user does not need to deal with viewports
  */
  extern(C) gboolean function(GstGLWindow* window) controlsViewport;

  /**
      Whether the window has output surface or not. (Since: 1.18)
  */
  extern(C) gboolean function(GstGLWindow* window) hasOutputSurface;

  /** */
  void*[2] Reserved;
}

/** */
struct GstGLWindowPrivate;

alias extern(C) void function(GstGLAllocationParams* src, GstGLAllocationParams* dest) GstGLAllocationParamsCopyFunc;

alias extern(C) void function(void* params) GstGLAllocationParamsFreeFunc;

alias extern(C) char* function(void* userData) GstGLAsyncDebugLogGetMessage;

alias extern(C) GstGLBaseMemory* function(GstGLBaseMemoryAllocator* allocator, GstGLAllocationParams* params) GstGLBaseMemoryAllocatorAllocFunction;

alias extern(C) GstGLBaseMemory* function(GstGLBaseMemory* mem, ptrdiff_t offset, ptrdiff_t size) GstGLBaseMemoryAllocatorCopyFunction;

alias extern(C) gboolean function(GstGLBaseMemory* mem, GError** _err) GstGLBaseMemoryAllocatorCreateFunction;

alias extern(C) void function(GstGLBaseMemory* mem) GstGLBaseMemoryAllocatorDestroyFunction;

alias extern(C) void* function(GstGLBaseMemory* mem, GstMapInfo* info, size_t maxsize) GstGLBaseMemoryAllocatorMapFunction;

alias extern(C) void function(GstGLBaseMemory* mem, GstMapInfo* info) GstGLBaseMemoryAllocatorUnmapFunction;

alias extern(C) void function(GstGLContext* context, void* data) GstGLContextThreadFunc;

alias extern(C) gboolean function(GstGLFilter* filter, GstGLMemory* inTex, void* userData) GstGLFilterRenderFunc;

alias extern(C) gboolean function(void* stuff) GstGLFramebufferFunc;

alias extern(C) void function(void* data) GstGLWindowCB;

alias extern(C) void function(void* data, uint width, uint height) GstGLWindowResizeCB;

