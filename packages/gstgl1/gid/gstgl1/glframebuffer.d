/// Module for [GLFramebuffer] class
module gid.gstgl1.glframebuffer;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.object;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glbase_memory;
import gid.gstgl1.glcontext;
import gid.gstgl1.glmemory;
import gid.gstgl1.types;

/**
    A #GstGLFramebuffer represents and holds an OpenGL framebuffer object with
    it's associated attachments.
    
    A #GstGLFramebuffer can be created with [gid.gstgl1.glframebuffer.GLFramebuffer.new_] or
    [gid.gstgl1.glframebuffer.GLFramebuffer.newWithDefaultDepth] and bound with
    [gid.gstgl1.glframebuffer.GLFramebuffer.bind].  Other resources can be bound with
    [gid.gstgl1.glframebuffer.GLFramebuffer.attach]
    
    Note: OpenGL framebuffers are not shareable resources so cannot be used
    between multiple OpenGL contexts.
*/
class GLFramebuffer : gid.gst1.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_framebuffer_get_type != &gidSymbolNotFound ? gst_gl_framebuffer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLFramebuffer";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLFramebuffer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstgl1.glframebuffer.GLFramebuffer]
      Returns: New builder object
  */
  static GLFramebufferGidBuilder builder() nothrow
  {
    return new GLFramebufferGidBuilder;
  }

  /**
      This function will internally create an OpenGL framebuffer object and must
      be called on context's OpenGL thread.
  
      Params:
        context = a #GstGLContext
      Returns: a new #GstGLFramebuffer
  */
  this(gid.gstgl1.glcontext.GLContext context) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GstGLFramebuffer* _cretval;
      _cretval = gst_gl_framebuffer_new(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
      this(_cretval, Yes.Take);
    }
  }

  /**
      This function will internally create an OpenGL framebuffer object and must
      be called on context's OpenGL thread.
  
      Params:
        context = a #GstGLContext
        width = width for the depth buffer
        height = for the depth buffer
      Returns: a new #GstGLFramebuffer with a depth buffer of width and height
  */
  static gid.gstgl1.glframebuffer.GLFramebuffer newWithDefaultDepth(gid.gstgl1.glcontext.GLContext context, uint width, uint height) nothrow
  {
    GstGLFramebuffer* _cretval;
    _cretval = gst_gl_framebuffer_new_with_default_depth(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, width, height);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstgl1.glframebuffer.GLFramebuffer)(cast(GstGLFramebuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      attach mem to attachment_point
      
      Must be called with the same OpenGL context current that fb was created
      with.
  
      Params:
        attachmentPoint = the OpenGL attachment point to bind mem to
        mem = the memory object to bind to attachment_point
  */
  void attach(uint attachmentPoint, gid.gstgl1.glbase_memory.GLBaseMemory mem) nothrow
  {
    gst_gl_framebuffer_attach(cast(GstGLFramebuffer*)this._cPtr, attachmentPoint, mem ? cast(GstGLBaseMemory*)mem._cPtr(No.Dup) : null);
  }

  /**
      Bind fb into the current thread
      
      Must be called with the same OpenGL context current that fb was created
      with.
  */
  void bind() nothrow
  {
    gst_gl_framebuffer_bind(cast(GstGLFramebuffer*)this._cPtr);
  }

  /**
      Perform the steps necessary to have the output of a glDraw* command in
      func update the contents of mem.
      
      Note: this function does not map mem for writing with OpenGL and that must
      be done manually by the caller using any of the mapping functions such as
      [gid.gst1.memory.Memory.map] with the map flags [gid.gst1.types.MapFlags.Write] | [gid.gstgl1.types.MAP_GL].
      
      Must be called with the same OpenGL context current that fb was created
      with.
  
      Params:
        mem = the #GstGLMemory to draw to
        func = the function to run
      Returns: the result of executing func
  */
  bool drawToTexture(gid.gstgl1.glmemory.GLMemory mem, gid.gstgl1.types.GLFramebufferFunc func) nothrow
  {
    extern(C) gboolean _funcCallback(void* stuff) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gstgl1.types.GLFramebufferFunc*)stuff;

      try
      {
        _dretval = (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.types.GLFramebufferFunc");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    bool _retval;
    auto _func = func ? cast(void*)&(func) : null;
    _retval = cast(bool)gst_gl_framebuffer_draw_to_texture(cast(GstGLFramebuffer*)this._cPtr, mem ? cast(GstGLMemory*)mem._cPtr(No.Dup) : null, _funcCB, _func);
    return _retval;
  }

  /**
      Retrieve the effective dimensions from the current attachments attached to
      fb.
  
      Params:
        width = output width
        height = output height
  */
  void getEffectiveDimensions(out uint width, out uint height) nothrow
  {
    gst_gl_framebuffer_get_effective_dimensions(cast(GstGLFramebuffer*)this._cPtr, cast(uint*)&width, cast(uint*)&height);
  }

  /** */
  uint getId() nothrow
  {
    uint _retval;
    _retval = gst_gl_framebuffer_get_id(cast(GstGLFramebuffer*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gstgl1.glframebuffer.GLFramebuffer]
class GLFramebufferGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstgl1.glframebuffer.GLFramebuffer]
final class GLFramebufferGidBuilder : GLFramebufferGidBuilderImpl!GLFramebufferGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLFramebuffer build() nothrow
  {
    return new GLFramebuffer(cast(void*)createGObject(GLFramebuffer._getGType), Yes.Take);
  }
}
