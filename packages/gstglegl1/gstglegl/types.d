/// D types for gstglegl1 library
module gstglegl.types;

import gid.gid;
import gstglegl.c.functions;
import gstglegl.c.types;
import gstglegl.eglimage;


// Callbacks

/**
    Function to be called when the GstEGLImage is destroyed. It should free
    the associated `EGLImage` if necessary

    Params:
      image = a #GstEGLImage (modified in place, changes are seen by the caller)
*/
alias EGLImageDestroyNotify = void delegate(gstglegl.eglimage.EGLImage image);

/** */
enum GL_DISPLAY_EGL_NAME = "gst.gl.display.egl";

/**
    The name of the GL Memory EGL allocator
*/
enum GL_MEMORY_EGL_ALLOCATOR_NAME = "GLMemoryEGL";
