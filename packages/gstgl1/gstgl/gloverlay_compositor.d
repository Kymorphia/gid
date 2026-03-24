/// Module for [GLOverlayCompositor] class
module gstgl.gloverlay_compositor;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gst.buffer;
import gst.caps;
import gst.object;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glcontext;
import gstgl.types;

/**
    Opaque #GstGLOverlayCompositor object
*/
class GLOverlayCompositor : gst.object.ObjectWrap
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
    return cast(void function())gst_gl_overlay_compositor_get_type != &gidSymbolNotFound ? gst_gl_overlay_compositor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLOverlayCompositor self()
  {
    return this;
  }

  /**
  Get builder for [gstgl.gloverlay_compositor.GLOverlayCompositor]
  Returns: New builder object
  */
  static GLOverlayCompositorGidBuilder builder()
  {
    return new GLOverlayCompositorGidBuilder;
  }

  /** */
  @property bool yinvert()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("yinvert");
  }

  /** */
  @property void yinvert(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("yinvert", propval);
  }

  /** */
  this(gstgl.glcontext.GLContext context)
  {
    GstGLOverlayCompositor* _cretval;
    _cretval = gst_gl_overlay_compositor_new(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /** */
  static gst.caps.Caps addCaps(gst.caps.Caps caps)
  {
    GstCaps* _cretval;
    _cretval = gst_gl_overlay_compositor_add_caps(caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  void drawOverlays()
  {
    gst_gl_overlay_compositor_draw_overlays(cast(GstGLOverlayCompositor*)this._cPtr);
  }

  /** */
  void freeOverlays()
  {
    gst_gl_overlay_compositor_free_overlays(cast(GstGLOverlayCompositor*)this._cPtr);
  }

  /** */
  void uploadOverlays(gst.buffer.Buffer buf)
  {
    gst_gl_overlay_compositor_upload_overlays(cast(GstGLOverlayCompositor*)this._cPtr, buf ? cast(GstBuffer*)buf._cPtr(No.Dup) : null);
  }
}

class GLOverlayCompositorGidBuilderImpl(T) : gst.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T yinvert(bool propval)
  {
    return setProperty("yinvert", propval);
  }
}

/// Fluent builder for [gstgl.gloverlay_compositor.GLOverlayCompositor]
final class GLOverlayCompositorGidBuilder : GLOverlayCompositorGidBuilderImpl!GLOverlayCompositorGidBuilder
{
  GLOverlayCompositor build()
  {
    return new GLOverlayCompositor(cast(void*)createGObject(GLOverlayCompositor._getGType), No.Take);
  }
}
