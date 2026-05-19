//!gir GstGLEGL-1.0
//!info description "D binding for the GstGLEGL library - OpenGL EGL library or the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gstglegl1/
//!info capi https://gstreamer.freedesktop.org/documentation/gl-egl/index.html

//!subctype EGLint int

//# Disable methods with arrays with sizes not described by parameters (FIXME)
//!set record[EGLImage].method[export_dmabuf][unsupported] 1
//!set record[EGLImage].function[from_dmabuf_direct][unsupported] 1
//!set record[EGLImage].function[from_dmabuf_direct_target][unsupported] 1
//!set record[EGLImage].function[from_dmabuf_direct_target_with_dma_drm][unsupported] 1

//# Disable EGLImage.fromTexture because the attribs parameter has a non-zero terminator (EGL_NONE), FIXME
//!set record[EGLImage].function[from_texture][unsupported] 1
