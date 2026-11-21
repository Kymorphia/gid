/// Module for [GLOverlayCompositor] class
module gid.gstgl1.gloverlay_compositor;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gst1.caps;
import gid.gst1.object;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glcontext;
import gid.gstgl1.types;

/**
    Opaque #GstGLOverlayCompositor object
*/
class GLOverlayCompositor : gid.gst1.object.ObjectWrap
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
    return cast(void function())gst_gl_overlay_compositor_get_type != &gidSymbolNotFound ? gst_gl_overlay_compositor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLOverlayCompositor";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLOverlayCompositor self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstgl1.gloverlay_compositor.GLOverlayCompositor]
      Returns: New builder object
  */
  static GLOverlayCompositorGidBuilder builder() nothrow
  {
    return new GLOverlayCompositorGidBuilder;
  }

  /** */
  @property bool yinvert() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("yinvert");
  }

  /** */
  @property void yinvert(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("yinvert", propval);
  }

  /** */
  this(gid.gstgl1.glcontext.GLContext context) nothrow
  {
    GstGLOverlayCompositor* _cretval;
    _cretval = gst_gl_overlay_compositor_new(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /** */
  static gid.gst1.caps.Caps addCaps(gid.gst1.caps.Caps caps) nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_gl_overlay_compositor_add_caps(caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  void drawOverlays() nothrow
  {
    gst_gl_overlay_compositor_draw_overlays(cast(GstGLOverlayCompositor*)this._cPtr);
  }

  /** */
  void freeOverlays() nothrow
  {
    gst_gl_overlay_compositor_free_overlays(cast(GstGLOverlayCompositor*)this._cPtr);
  }

  /** */
  void uploadOverlays(gid.gst1.buffer.Buffer buf) nothrow
  {
    gst_gl_overlay_compositor_upload_overlays(cast(GstGLOverlayCompositor*)this._cPtr, buf ? cast(GstBuffer*)buf._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gstgl1.gloverlay_compositor.GLOverlayCompositor]
class GLOverlayCompositorGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T yinvert(bool propval) nothrow
  {
    return setProperty("yinvert", propval);
  }
}

/// Fluent builder for [gid.gstgl1.gloverlay_compositor.GLOverlayCompositor]
final class GLOverlayCompositorGidBuilder : GLOverlayCompositorGidBuilderImpl!GLOverlayCompositorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLOverlayCompositor build() nothrow
  {
    return new GLOverlayCompositor(cast(void*)createGObject(GLOverlayCompositor._getGType), Yes.Take);
  }
}
