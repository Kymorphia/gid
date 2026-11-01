//!gir GstGLEGL-1.0
//!info description "D binding for the GstGLEGL library - OpenGL EGL library or the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gstglegl1/
//!info capi https://gstreamer.freedesktop.org/documentation/gl-egl/index.html

//!subctype EGLint int

//# Disable methods with arrays with sizes not described by parameters (FIXME)
//!set record[EGLImage].method[export_dmabuf][disable] 1
//!set record[EGLImage].function[from_dmabuf_direct][disable] 1
//!set record[EGLImage].function[from_dmabuf_direct_target][disable] 1
//!set record[EGLImage].function[from_dmabuf_direct_target_with_dma_drm][disable] 1

//# Disable EGLImage.fromTexture because the attribs parameter has a non-zero terminator (EGL_NONE), FIXME
//!set record[EGLImage].function[from_texture][disable] 1

//# Disable: Destroy notify is called during EGLImage finalization, wrapping the image would take a reference to a finalizing object (FIXME)
//!set record[EGLImage].constructor[new_wrapped][disable] 1
